# Day 58 – Metrics Server and Horizontal Pod Autoscaler (HPA)

---

# 📌 Introduction (Theory)

## 🔹 What is Metrics Server?

Metrics Server is a cluster-wide component that collects resource usage data from kubelets.

It provides:

* CPU usage
* Memory usage

👉 Used by:

* `kubectl top`
* Horizontal Pod Autoscaler (HPA)

Without Metrics Server:

* No real-time metrics ❌
* HPA cannot function ❌

---

## 🔹 What is HPA?

Horizontal Pod Autoscaler automatically scales the number of pods based on resource usage.

👉 It adjusts replicas dynamically:

* Scale up when load increases 🚀
* Scale down when load decreases 🐢

---

## 🔹 How HPA Works (Core Formula)

```
desiredReplicas = ceil(currentReplicas * (currentUsage / targetUsage))
```

Example:

* Current replicas = 1
* CPU usage = 100m
* Target = 50m

→ New replicas = 2

---

## 🔹 autoscaling/v1 vs autoscaling/v2

| Feature          | v1 | v2 |
| ---------------- | -- | -- |
| CPU Metrics      | ✅  | ✅  |
| Memory Metrics   | ❌  | ✅  |
| Custom Metrics   | ❌  | ✅  |
| Behavior Control | ❌  | ✅  |

---

# 🔹 Task 1: Install the Metrics Server

### Commands:

```bash id="7d04ry"
kubectl get pods -n kube-system | grep metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

### Fix for local cluster:

```yaml id="vjwmbk"
- --kubelet-insecure-tls
```

### Verify:

```bash id="0wfm7t"
kubectl top nodes
kubectl top pods -A
```

### ✅ Verification:

Metrics Server installed successfully.

Example:

* CPU: 180m (9%)
* Memory: 950Mi (40%)

---

# 🔹 Task 2: Explore kubectl top

### Commands:

```bash id="vw8r2q"
kubectl top nodes
kubectl top pods -A
kubectl top pods -A --sort-by=cpu
```

### 📌 Theory:

* Shows **real-time usage**
* Not same as requests/limits
* Data refresh every ~15 seconds

### ✅ Verification:

Top CPU-consuming pod identified.

---

# 🔹 Task 3: Create Deployment with CPU Requests

### YAML:

```yaml id="31yqmn"
resources:
  requests:
    cpu: 200m
```

### Apply:

```bash id="s0y9mf"
kubectl apply -f deployment.yaml
kubectl expose deployment php-apache --port=80
```

### 📌 Theory:

* HPA calculates % using **requests**
* Without requests → HPA fails

### Verify:

```bash id="6hrmhl"
kubectl top pods
```

### ✅ Verification:

Pod CPU usage visible (e.g., 5m)

---

# 🔹 Task 4: Create HPA (Imperative)

```bash id="m4z6y1"
kubectl autoscale deployment php-apache --cpu=50% --min=1 --max=10
```

### 📌 Theory:

* Target = 50% CPU utilization
* Checks every 15 seconds

### Verify:

```bash id="fr4d2g"
kubectl get hpa
```

### ✅ Verification:

TARGETS shows current vs target (e.g., 10%/50%)

---

# 🔹 Task 5: Generate Load & Watch Autoscaling

```bash id="8f8kzv"
kubectl run load-generator --image=busybox:1.36 --restart=Never -- \
/bin/sh -c "while true; do wget -q -O- http://php-apache; done"
```

```bash id="p5c1n8"
kubectl get hpa php-apache --watch
```

### 📌 Theory:

* CPU ↑ → scale up
* CPU ↓ → scale down
* Scale-down delayed (~5 min)

### Stop:

```bash id="nxrprj"
kubectl delete pod load-generator
```

### ✅ Verification:

Scaled from 1 → 4 replicas

---

# 🔹 Task 6: HPA using YAML (Declarative)

### YAML:

```yaml id="5w7xkn"
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: php-apache
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: php-apache
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 0
    scaleDown:
      stabilizationWindowSeconds: 300
```

### 📌 Theory (IMPORTANT):

Behavior section controls scaling speed:

* **scaleUp**
  → How fast pods increase ⚡

* **scaleDown**
  → How slow pods decrease 🐢

### Apply:

```bash id="48h6fw"
kubectl apply -f hpa.yaml
```

### Verify:

```bash id="0y2kkw"
kubectl describe hpa php-apache
```

### ✅ Verification:

Custom scaling behavior applied successfully.

---

# 🔹 Task 7: Clean Up

```bash id="8n0jcv"
kubectl delete hpa php-apache
kubectl delete service php-apache
kubectl delete deployment php-apache
kubectl delete pod load-generator
```

### ✅ Verification:

All resources deleted, Metrics Server still running.

---

# 🎯 Key Learnings

* Metrics Server = real-time monitoring backbone
* CPU requests = mandatory for HPA
* HPA works every ~15 seconds
* Scale-up fast, scale-down slow
* autoscaling/v2 = production-ready

---

# 🔥 Final Conclusion

Today I implemented Kubernetes autoscaling end-to-end.

✔ Installed Metrics Server
✔ Monitored real-time usage
✔ Configured HPA
✔ Observed live scaling

From 1 pod → multiple replicas under load
→ Automatically scaled down

👉 This is how modern cloud systems handle traffic efficiently 🚀

