# 🚀 Day 52 - Kubernetes Namespaces & Deployments

---

## 📌 What are Namespaces?

Namespaces in Kubernetes are used to **organize and isolate resources** within a cluster.

👉 Why use them?

* Separate environments (dev, staging, production)
* Avoid naming conflicts
* Better resource management

---

## 📂 Default Namespaces

```
kubectl get namespaces
```

* default
* kube-system
* kube-public
* kube-node-lease

---

## 🛠️ Creating Namespaces

```
kubectl create namespace dev
kubectl create namespace staging
```

Using YAML:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production
```

---

## 📦 Running Pods in Namespace

```
kubectl run nginx-dev --image=nginx -n dev
kubectl run nginx-staging --image=nginx -n staging
```

Check all pods:

```
kubectl get pods -A
```

---

## 🚀 What is Deployment?

Deployment ensures:
👉 Desired number of pods always running
👉 Self-healing
👉 Scaling
👉 Rolling updates

---

## 📄 Deployment YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: dev
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
        image: nginx:1.24
```

---

## 📊 Deployment Output Meaning

* READY → Running pods
* UP-TO-DATE → Updated pods
* AVAILABLE → Serving traffic

---

## 🔁 Self-Healing

Delete a pod:

```
kubectl delete pod <pod-name> -n dev
```

👉 Deployment automatically creates a new pod
👉 New pod has **different name**

---

## 📈 Scaling

Scale up:

```
kubectl scale deployment nginx-deployment --replicas=5 -n dev
```

Scale down:

```
kubectl scale deployment nginx-deployment --replicas=2 -n dev
```

👉 Extra pods are **terminated automatically**

---

## 🔄 Rolling Update

Update image:

```
kubectl set image deployment/nginx-deployment nginx=nginx:1.25 -n dev
```

👉 Pods updated one by one (zero downtime)

---

## ⏪ Rollback

```
kubectl rollout undo deployment/nginx-deployment -n dev
```

👉 Previous version restored

---

## 🧠 Key Learnings

* Namespaces isolate resources
* Deployments manage pods automatically
* Scaling adjusts pod count
* Rolling updates ensure zero downtime
* Rollback restores previous version

---

## 🎯 Conclusion

Kubernetes Deployments are the **real way to run applications**, providing automation, reliability, and scalability.

---
