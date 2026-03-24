# 🚀 Day 53 – Kubernetes Services

## 📌 Introduction

In Kubernetes, Pods are dynamic — their IP addresses change whenever they restart.
Also, a Deployment runs multiple Pods, so it is difficult to directly communicate with them.

👉 **Solution: Kubernetes Services**

A Service provides:

* Stable IP address
* DNS name
* Load balancing across Pods

---

## 🧠 How Service Works

```
Client → Service → Pods
```

The Service acts as a stable layer between clients and Pods.

---

## ⚙️ Task 1: Create Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
```

```bash
kubectl apply -f app-deployment.yaml
kubectl get pods -o wide
```

---

## 🔹 Task 2: ClusterIP Service

👉 Used for internal communication

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-app-clusterip
spec:
  type: ClusterIP
  selector:
    app: web-app
  ports:
  - port: 80
    targetPort: 80
```

```bash
kubectl apply -f clusterip-service.yaml
kubectl get services
```

### ✅ Test

```bash
kubectl run test-client --image=busybox --rm -it -- sh

wget -qO- http://web-app-clusterip
```

---

## 🌐 Task 3: DNS in Kubernetes

Kubernetes automatically assigns DNS names to Services.

Format:

```
<service-name>.<namespace>.svc.cluster.local
```

Example:

```
web-app-clusterip.default.svc.cluster.local
```

### Test

```bash
nslookup web-app-clusterip
```

---

## 🔹 Task 4: NodePort Service

👉 Used for external access via Node

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-app-nodeport
spec:
  type: NodePort
  selector:
    app: web-app
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30080
```

```bash
kubectl apply -f nodeport-service.yaml
kubectl get services
```

### Access

* Docker Desktop / Kind:

```
kubectl port-forward service/web-app-nodeport 8080:80
http://localhost:8080
```

---

## 🔹 Task 5: LoadBalancer Service

👉 Used in cloud environments

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-app-loadbalancer
spec:
  type: LoadBalancer
  selector:
    app: web-app
  ports:
  - port: 80
    targetPort: 80
```

```bash
kubectl apply -f loadbalancer-service.yaml
kubectl get services
```

⚠️ In local clusters → `EXTERNAL-IP = <pending>`

---

## 📊 Task 6: Service Comparison

```bash
kubectl get services -o wide
```

| Type         | Accessible From | Use Case               |
| ------------ | --------------- | ---------------------- |
| ClusterIP    | Inside cluster  | Internal communication |
| NodePort     | Node IP         | Testing                |
| LoadBalancer | Public IP       | Production             |

---

## 🔥 Important Concept

```
LoadBalancer → NodePort → ClusterIP
```

Every LoadBalancer service includes:

* ClusterIP
* NodePort

---

## 🔍 Endpoints

Check which Pods a Service routes to:

```bash
kubectl get endpoints web-app-clusterip
```

---

## 🧹 Cleanup

```bash
kubectl delete -f .
```

---

## 🎯 Key Learnings

* Pods are dynamic (IP changes)
* Services provide stable access
* DNS simplifies service discovery
* Load balancing is automatic

---

## 💡 Summary

Kubernetes Services are essential for communication between components.
They provide stability, scalability, and reliability in a dynamic environment.

---

