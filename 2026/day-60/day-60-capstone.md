# Day 60 – Capstone: Deploy WordPress + MySQL on Kubernetes

## 🔥 Overview

In this capstone project, I deployed a complete WordPress + MySQL application using Kubernetes. This project demonstrates how different Kubernetes components work together to build a real-world application with scalability, persistence, and self-healing.

---

## 🏗️ Architecture

User → NodePort Service → WordPress Deployment → MySQL StatefulSet → Persistent Volume

* WordPress connects to MySQL using internal DNS
* MySQL stores data persistently using PVC
* Deployment ensures high availability
* StatefulSet ensures stable identity and storage

---

## ⚙️ Implementation

---

## 🔹 1. Namespace

Namespace is used to isolate resources in Kubernetes.

```bash
kubectl create namespace capstone
kubectl config set-context --current --namespace=capstone
```

---

## 🔹 2. MySQL Setup

### 🔸 Secret

Secret is used to store sensitive data like database credentials securely.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
type: Opaque
stringData:
  MYSQL_ROOT_PASSWORD: root123
  MYSQL_DATABASE: wordpress
  MYSQL_USER: wpuser
  MYSQL_PASSWORD: wppass
```

---

### 🔸 Headless Service

Headless Service provides stable DNS for StatefulSet pods.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  clusterIP: None
  selector:
    app: mysql
  ports:
    - port: 3306
```

---

### 🔸 StatefulSet

StatefulSet is used for MySQL to ensure persistent storage and stable pod identity.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
spec:
  serviceName: mysql
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
        - name: mysql
          image: mysql:8.0
          envFrom:
            - secretRef:
                name: mysql-secret
          resources:
            requests:
              cpu: "250m"
              memory: "512Mi"
            limits:
              cpu: "500m"
              memory: "1Gi"
          volumeMounts:
            - name: mysql-storage
              mountPath: /var/lib/mysql
  volumeClaimTemplates:
    - metadata:
        name: mysql-storage
      spec:
        accessModes: ["ReadWriteOnce"]
        resources:
          requests:
            storage: 1Gi
```

---

## 🔹 3. WordPress Setup

### 🔸 ConfigMap

ConfigMap stores non-sensitive configuration like DB host and DB name.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: wp-config
data:
  WORDPRESS_DB_HOST: mysql-0.mysql.capstone.svc.cluster.local:3306
  WORDPRESS_DB_NAME: wordpress
```

---

### 🔸 Deployment

Deployment manages WordPress pods and ensures scaling and self-healing.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
spec:
  replicas: 2
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
        - name: wordpress
          image: wordpress:latest
          envFrom:
            - configMapRef:
                name: wp-config
          env:
            - name: WORDPRESS_DB_USER
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: MYSQL_USER
            - name: WORDPRESS_DB_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: MYSQL_PASSWORD
          resources:
            requests:
              cpu: "200m"
              memory: "256Mi"
            limits:
              cpu: "500m"
              memory: "512Mi"
          ports:
            - containerPort: 80
```

---

### 🔸 NodePort Service

NodePort Service exposes WordPress outside the cluster.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: wordpress
spec:
  type: NodePort
  selector:
    app: wordpress
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```

---

## 🔹 4. Access Application

```bash
kubectl port-forward svc/wordpress 8080:80
```

Open in browser: http://localhost:8080

---

## 🔹 5. Self-Healing

Deployment automatically recreates WordPress pods when deleted.

```bash
kubectl delete pod -l app=wordpress
```

StatefulSet recreates MySQL pod with same data.

```bash
kubectl delete pod mysql-0
```

---

## 🔹 6. Persistence

Data remains safe because MySQL uses Persistent Volume.

---

## 🔹 7. HPA (Autoscaling)

HPA automatically scales pods based on CPU usage.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: wordpress-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: wordpress
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 50
```

---

## 🔹 8. Helm Comparison

Helm simplifies deployment by automating resource creation, while manual YAML provides better control.

```bash
kubectl create namespace helm-wp
helm install wp-helm bitnami/wordpress -n helm-wp
helm uninstall wp-helm -n helm-wp
kubectl delete namespace helm-wp
```

---

## 🔹 9. Cleanup

Deleting namespace removes all resources.

```bash
kubectl delete namespace capstone
kubectl config set-context --current --namespace=default
```

---

## 📊 Concepts Used

Namespace, Secret, ConfigMap, PVC, StatefulSet, Headless Service, Deployment, NodePort Service, Resource Limits, HPA, Helm

---

## 🤔 Reflection

This project helped understand how different Kubernetes components work together. The most challenging part was debugging WordPress readiness and connectivity.

---

## ✅ Conclusion

Successfully deployed a production-like application using Kubernetes with scalability, persistence, and self-healing.

---

#90DaysOfDevOps #DevOps #Kubernetes #TrainWithShubham

