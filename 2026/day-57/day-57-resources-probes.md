# Day 57 – Resource Requests, Limits, and Probes

## 📌 Introduction

Kubernetes needs to know:
- How much CPU & memory a Pod needs
- Whether the application is healthy

This is done using:
- Resource Requests & Limits
- Probes (Liveness, Readiness, Startup)

---

## 🔥 Task 1: Resource Requests & Limits

### Pod YAML

apiVersion: v1
kind: Pod
metadata:
  name: resource-pod
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      requests:
        cpu: "100m"
        memory: "128Mi"
      limits:
        cpu: "250m"
        memory: "256Mi"

kubectl apply -f pod.yaml
kubectl describe pod resource-pod

### 🔍 Observation
- Requests: minimum guaranteed
- Limits: maximum allowed
- QoS Class: Burstable

### ✅ Answer
QoS Class = Burstable

---

## 🔥 Task 2: OOMKilled

apiVersion: v1
kind: Pod
metadata:
  name: stress-pod
spec:
  containers:
  - name: stress
    image: polinux/stress
    command: ["stress"]
    args: ["--vm", "1", "--vm-bytes", "200M", "--vm-hang", "1"]
    resources:
      limits:
        memory: "100Mi"

kubectl apply -f stress.yaml
kubectl describe pod stress-pod

### 🔍 Observation
- Pod crashes immediately
- Reason: OOMKilled
- Exit Code: 137

### ✅ Answer
Exit Code = 137

---

## 🔥 Task 3: Pending Pod

apiVersion: v1
kind: Pod
metadata:
  name: big-pod
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      requests:
        cpu: "100"
        memory: "128Gi"

kubectl apply -f big.yaml
kubectl describe pod big-pod

### 🔍 Observation
Pod stays Pending

### ✅ Answer
Scheduler message: insufficient resources

---

## 🔥 Task 4: Liveness Probe

apiVersion: v1
kind: Pod
metadata:
  name: liveness-pod
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["/bin/sh", "-c", "touch /tmp/healthy; sleep 30; rm -f /tmp/healthy; sleep 600"]
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      periodSeconds: 5
      failureThreshold: 3

kubectl apply -f liveness.yaml
kubectl get pod -w

### 🔍 Observation
Pod restarts after probe failure

### ✅ Answer
Container restarts multiple times

---

## 🔥 Task 5: Readiness Probe

apiVersion: v1
kind: Pod
metadata:
  name: readiness-pod
spec:
  containers:
  - name: nginx
    image: nginx
    readinessProbe:
      httpGet:
        path: /
        port: 80

kubectl apply -f readiness.yaml
kubectl expose pod readiness-pod --port=80 --name=readiness-svc

kubectl get endpoints readiness-svc

kubectl exec readiness-pod -- rm /usr/share/nginx/html/index.html

### 🔍 Observation
- Pod becomes Not Ready
- Removed from endpoints
- No restart

### ✅ Answer
Container is NOT restarted

---

## 🔥 Task 6: Startup Probe

apiVersion: v1
kind: Pod
metadata:
  name: startup-pod
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["/bin/sh", "-c", "sleep 20 && touch /tmp/started && sleep 300"]
    startupProbe:
      exec:
        command:
        - cat
        - /tmp/started
      periodSeconds: 5
      failureThreshold: 12
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/started

kubectl apply -f startup.yaml

### 🔍 Observation
Startup probe prevents early failure

### ✅ Answer
If failureThreshold = 2 → pod would restart early

---

## 🔥 Task 7: Clean Up

kubectl delete pod --all
kubectl delete svc --all

---

## 🎯 Summary

- Requests → scheduling  
- Limits → enforcement  
- OOMKilled → memory exceeded  
- Pending → insufficient resources  
- Liveness → restart  
- Readiness → remove from traffic  
- Startup → delay checks  

---

## 🚀 Learning

Kubernetes ensures:
- Efficient resource usage  
- Self-healing applications  
- High availability  

---

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
