# Day 59 – Helm — Kubernetes Package Manager

## 🚀 What is Helm?
Helm is the package manager for Kubernetes, similar to apt in Ubuntu.  
It helps you manage complex Kubernetes applications using reusable templates called charts.

---

## 🔑 Core Concepts

- Chart → A package of Kubernetes YAML templates  
- Release → A deployed instance of a chart  
- Repository → A collection of charts  

---

## ⚙️ Task 1: Install Helm

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

Verify:
helm version  
helm env  

✔️ Helm version: v3.x.x  

---

## 📦 Task 2: Add Repository & Search

helm repo add bitnami https://charts.bitnami.com/bitnami  
helm repo update  
helm search repo nginx  
helm search repo bitnami  

✔️ Bitnami contains hundreds of charts  

---

## 🌐 Task 3: Install a Chart

helm install my-nginx bitnami/nginx  

Check:
kubectl get all  
helm list  
helm status my-nginx  

✔️ Pods running: 1  
✔️ Service type: ClusterIP  

---

## ⚙️ Task 4: Customize with Values

View defaults:
helm show values bitnami/nginx  

Install with overrides:
helm install nginx-cli bitnami/nginx --set replicaCount=3 --set service.type=NodePort  

custom-values.yaml:

replicaCount: 2  
service:  
  type: NodePort  

resources:  
  limits:  
    cpu: "200m"  
    memory: "256Mi"  
  requests:  
    cpu: "100m"  
    memory: "128Mi"  

Install using file:
helm install nginx-values bitnami/nginx -f custom-values.yaml  

Verify:
helm get values nginx-values  
kubectl get pods  
kubectl get svc  

✔️ Correct replicas and NodePort service applied  

---

## 🔄 Task 5: Upgrade & Rollback

helm upgrade my-nginx bitnami/nginx --set replicaCount=5  

helm history my-nginx  

helm rollback my-nginx 1  

✔️ Rollback creates new revision  
✔️ Total revisions after rollback: 3  

---

## 🏗️ Task 6: Create Your Own Chart

helm create my-app  

Edit values.yaml:

replicaCount: 3  

image:  
  repository: nginx  
  tag: "1.25"  

Validate:
helm lint my-app  

Preview:
helm template my-release ./my-app  

Install:
helm install my-release ./my-app  

Upgrade:
helm upgrade my-release ./my-app --set replicaCount=5  

✔️ After install: 3 replicas  
✔️ After upgrade: 5 replicas  

---

## 🧹 Task 7: Clean Up

helm uninstall my-release  
helm uninstall my-nginx  
helm uninstall nginx-cli  
helm uninstall nginx-values  

rm -rf my-app  
rm custom-values.yaml  

Verify:
helm list  

✔️ No releases remaining  

---

## 📂 Helm Chart Structure

- Chart.yaml → metadata  
- values.yaml → default values  
- templates/ → Kubernetes YAML templates  

---

## 🧠 Go Templating Basics

- {{ .Values.replicaCount }}  
- {{ .Chart.Name }}  
- {{ .Release.Name }}  

---

## 🎯 Key Learnings

- Helm simplifies Kubernetes deployments  
- One command replaces multiple YAML files  
- Easy customization using values.yaml  
- Supports upgrade and rollback  
- Helps manage production-ready apps  

---

## ✅ Conclusion

Helm makes Kubernetes powerful and manageable by packaging, templating, and versioning applications efficiently.
