# Day 56 – Kubernetes StatefulSets

## 📌 Introduction
StatefulSets are used for stateful applications like databases (MySQL, PostgreSQL, Kafka).  
They provide stable identity, ordered deployment, and persistent storage.

---

## 🔥 Task 1: Understand the Problem

### Create Deployment (YAML)
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx

kubectl apply -f deployment.yaml
kubectl get pods

### Observation
- Pod names are random  
- Example: nginx-deployment-abc12  

kubectl delete pod <pod-name>

- New pod gets a different name  

### Verify Answer
Random pod names break identity, connections, and data consistency in database clusters.

kubectl delete deployment nginx-deployment

---

## 🔥 Task 2: Headless Service

apiVersion: v1
kind: Service
metadata:
  name: nginx-headless
spec:
  clusterIP: None
  selector:
    app: nginx
  ports:
    - port: 80

kubectl apply -f service.yaml
kubectl get svc

### Verify Answer
CLUSTER-IP shows: None

---

## 🔥 Task 3: StatefulSet

apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web
spec:
  serviceName: nginx-headless
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        volumeMounts:
        - name: web-data
          mountPath: /usr/share/nginx/html
  volumeClaimTemplates:
  - metadata:
      name: web-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 100Mi

kubectl apply -f statefulset.yaml
kubectl get pods -w

### Observation
Pods created in order:
web-0 → web-1 → web-2

kubectl get pvc

PVC names:
web-data-web-0  
web-data-web-1  
web-data-web-2  

### Verify Answer
Pods: web-0, web-1, web-2  
PVCs: web-data-web-0, web-data-web-1, web-data-web-2  

---

## 🔥 Task 4: Stable Network Identity

kubectl run test --image=busybox -it --rm -- sh

nslookup web-0.nginx-headless  
nslookup web-1.nginx-headless  
nslookup web-2.nginx-headless  

kubectl get pods -o wide

### Verify Answer
Yes, nslookup IP matches the pod IP.

---

## 🔥 Task 5: Stable Storage

kubectl exec web-0 -- sh -c "echo 'Data from web-0' > /usr/share/nginx/html/index.html"

kubectl exec web-0 -- cat /usr/share/nginx/html/index.html

kubectl delete pod web-0

kubectl get pods -w

kubectl exec web-0 -- cat /usr/share/nginx/html/index.html

### Verify Answer
Yes, data remains the same after pod recreation.

---

## 🔥 Task 6: Ordered Scaling

kubectl scale statefulset web --replicas=5

kubectl get pods -w

Pods created:
web-3 → web-4

kubectl scale statefulset web --replicas=3

Pods deleted:
web-4 → web-3

kubectl get pvc

### Verify Answer
5 PVCs exist after scaling down.

---

## 🔥 Task 7: Clean Up

kubectl delete statefulset web  
kubectl delete svc nginx-headless  

kubectl get pvc  

kubectl delete pvc --all  

### Verify Answer
PVCs are NOT auto-deleted.

---

## 🎯 Final Summary

- Deployment → random identity  
- StatefulSet → stable identity  
- Headless Service → DNS per pod  
- PVC → one per pod  
- Data persists after deletion  
- Scaling is ordered  
- PVCs are not deleted automatically  

---

## 🚀 Learning

StatefulSets are essential for:
- Databases  
- Distributed systems  
- Applications requiring stable identity  

---

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
