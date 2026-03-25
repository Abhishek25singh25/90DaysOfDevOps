# Day 54 – Kubernetes ConfigMaps and Secrets

## 📌 Introduction

In real-world applications, configuration values like database URLs, API keys, ports, and feature flags should not be hardcoded inside container images. Kubernetes provides two resources to manage such configurations:

* **ConfigMaps** → for non-sensitive data
* **Secrets** → for sensitive data

---

## 🔹 What is a ConfigMap?

A ConfigMap is used to store **non-sensitive configuration data** in key-value pairs.

### ✅ Examples:

* APP_ENV
* PORT
* Config files like nginx.conf

### 🔥 Key Point:

ConfigMaps store data in **plain text**

* No encoding
* No encryption

---

## 🔹 What is a Secret?

Secrets are used to store **sensitive data** such as:

* Passwords
* API Keys
* Tokens

### 🔥 Key Point:

* Stored in **base64 encoded format**
* Base64 is **encoding, not encryption**

---

## 🔹 ConfigMap vs Secret

| Feature   | ConfigMap     | Secret             |
| --------- | ------------- | ------------------ |
| Data Type | Non-sensitive | Sensitive          |
| Storage   | Plain Text    | Base64 Encoded     |
| Security  | Low           | Better (RBAC etc.) |

---

# 🚀 Task 1: Create ConfigMap from Literals

## Command:

kubectl create configmap app-config 
--from-literal=APP_ENV=production 
--from-literal=APP_DEBUG=false 
--from-literal=APP_PORT=8080

## Verify:

kubectl get configmap app-config -o yaml

## Output:

All key-value pairs visible in plain text.

## ✅ Answer:

Yes, all three key-value pairs are visible.

---

# 🚀 Task 2: Create ConfigMap from File

## Step 1: Create file

default.conf

server {
listen 80;

```
location /health {
    return 200 "healthy";
}
```

}

## Step 2: Create ConfigMap

kubectl create configmap nginx-config --from-file=default.conf=default.conf

## Step 3: Verify

kubectl get configmap nginx-config -o yaml

## Observation:

* Key = default.conf
* Value = file content

## Important Concept:

When mounted into a Pod:

* Key becomes **filename**
* Value becomes **file content**

## ✅ Answer:

Yes, the file content is visible inside the ConfigMap.

---

# 🚀 Task 3: Use ConfigMap in Pod

## Part A: Environment Variables

apiVersion: v1
kind: Pod
metadata:
name: env-pod
spec:
containers:

* name: busybox
  image: busybox
  command: ["sh", "-c", "env && sleep 3600"]
  envFrom:

  * configMapRef:
    name: app-config

## Verify:

kubectl logs env-pod

## Output:

APP_ENV=production
APP_DEBUG=false
APP_PORT=8080

---

## Part B: Volume Mount (Nginx)

apiVersion: v1
kind: Pod
metadata:
name: nginx-pod
spec:
containers:

* name: nginx
  image: nginx
  volumeMounts:

  * name: config-volume
    mountPath: /etc/nginx/conf.d
    volumes:
* name: config-volume
  configMap:
  name: nginx-config

## Verify:

kubectl exec nginx-pod -- curl -s http://localhost/health

## Output:

healthy

## Concept:

* ConfigMap file mounted into container
* Nginx uses that config

---

# 🚀 Task 4: Create Secret

## Command:

kubectl create secret generic db-credentials 
--from-literal=DB_USER=admin 
--from-literal=DB_PASSWORD=s3cureP@ssw0rd

## Verify:

kubectl get secret db-credentials -o yaml

## Output:

Values are base64 encoded

## Decode:

kubectl get secret db-credentials -o jsonpath='{.data.DB_PASSWORD}' | base64 --decode

## Output:

s3cureP@ssw0rd

## ✅ Answer:

Yes, password can be decoded back to plaintext.

---

# 🚀 Task 5: Use Secret in Pod

apiVersion: v1
kind: Pod
metadata:
name: secret-pod
spec:
containers:

* name: busybox
  image: busybox
  command: ["sh", "-c", "sleep 3600"]
  env:

  * name: DB_USER
    valueFrom:
    secretKeyRef:
    name: db-credentials
    key: DB_USER
    volumeMounts:
  * name: secret-volume
    mountPath: /etc/db-credentials
    readOnly: true
    volumes:
* name: secret-volume
  secret:
  secretName: db-credentials

## Verify:

kubectl exec secret-pod -- cat /etc/db-credentials/DB_PASSWORD

## Output:

s3cureP@ssw0rd

## ✅ Answer:

Mounted values are **plaintext (not base64)**

---

# 🚀 Task 6: Update ConfigMap (Live Update)

## Step 1:

kubectl create configmap live-config --from-literal=message=hello

## Step 2: Pod

apiVersion: v1
kind: Pod
metadata:
name: live-pod
spec:
containers:

* name: busybox
  image: busybox
  command: ["/bin/sh", "-c"]
  args:

  * while true; do cat /config/message; sleep 5; done
    volumeMounts:
  * name: config-volume
    mountPath: /config
    volumes:
* name: config-volume
  configMap:
  name: live-config

## Step 3:

kubectl exec live-pod -- cat /config/message

Output: hello

## Step 4: Update ConfigMap

kubectl patch configmap live-config 
--type merge -p '{"data":{"message":"world"}}'

## Step 5:

kubectl exec live-pod -- cat /config/message

Output: world

## ✅ Final Answer:

Yes, the volume-mounted value changed automatically without restarting the Pod.

---

## 🔥 Important Observation

| Method               | Updates Automatically |
| -------------------- | --------------------- |
| Volume Mount         | Yes                   |
| Environment Variable | No                    |

---

# 🚀 Task 7: Cleanup

kubectl delete pod env-pod nginx-pod secret-pod live-pod
kubectl delete configmap app-config nginx-config live-config
kubectl delete secret db-credentials

## ✅ Answer:

All resources deleted successfully.

---

# 🧠 Key Learnings

* ConfigMaps store data in plain text
* Secrets use base64 encoding (not encryption)
* ConfigMaps can be used as env variables or volume mounts
* Secrets can also be injected in both ways
* Volume-mounted ConfigMaps auto update
* Environment variables do not update automatically

---

# 🎯 Conclusion

* Use ConfigMaps → non-sensitive data
* Use Secrets → sensitive data
* Use env variables → simple values
* Use volumes → config files
* Understand base64 vs encryption

---

✅ Day 54 Completed 🚀

