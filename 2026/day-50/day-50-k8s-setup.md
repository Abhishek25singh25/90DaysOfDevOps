# Day 50 – Kubernetes Architecture and Cluster Setup

## 🚀 Task 1: Kubernetes Story

Kubernetes was created to manage containers at scale. Docker can run containers, but it cannot handle multiple containers across many machines efficiently. It does not provide automatic scaling, load balancing, or self-healing.

Kubernetes solves these problems by managing containers automatically. It can scale applications, restart failed containers, and distribute load.

Kubernetes was created by Google and inspired by their internal system called Borg.

The name "Kubernetes" means "Helmsman" or "Ship Captain", which represents controlling and managing containers like a ship.

---

## 🧠 Task 2: Kubernetes Architecture

### 📊 Diagram (Text-Based)

            Control Plane (Master Node)
        -----------------------------------
        |  API Server                     |
        |  etcd                          |
        |  Scheduler                     |
        |  Controller Manager            |
        -----------------------------------
                     |
        -----------------------------------
        |         Worker Node             |
        |  kubelet                       |
        |  kube-proxy                    |
        |  container runtime             |
        -----------------------------------

---

### 🔹 Explanation

Control Plane:
- API Server → Entry point for all commands
- etcd → Stores cluster data
- Scheduler → Assigns pods to nodes
- Controller Manager → Maintains desired state

Worker Node:
- kubelet → Talks to API server and manages pods
- kube-proxy → Handles networking
- Container runtime → Runs containers

---

### 🔄 Request Flow

When we run:
kubectl apply -f pod.yaml

1. Request goes to API Server  
2. Data is stored in etcd  
3. Scheduler selects node  
4. kubelet creates pod  
5. Container runtime runs container  

---

### ⚠️ Failure Cases

If API Server goes down:
- Cluster keeps running
- No new commands work

If Worker Node goes down:
- Pods are lost
- Kubernetes recreates them on other nodes

---

## 🛠️ Task 3: Install kubectl

curl -LO "https://dl.k8s.io/release/\$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"  
chmod +x kubectl  
sudo mv kubectl /usr/local/bin/  
kubectl version --client  

---

## ⚙️ Task 4: Set Up Cluster (kind)

I used **kind (Kubernetes in Docker)** because it is lightweight and easy to use locally.

Install kind:

curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64  
chmod +x ./kind  
sudo mv ./kind /usr/local/bin/kind  

Create cluster:

kind create cluster --name devops-cluster  

Verify:

kubectl cluster-info  
kubectl get nodes  

---

## 🔍 Task 5: Explore Cluster

kubectl cluster-info  
kubectl get nodes  
kubectl describe node devops-cluster-control-plane  
kubectl get namespaces  
kubectl get pods -A  
kubectl get pods -n kube-system  

Explanation:
- Nodes → Machines in cluster  
- Namespaces → Logical separation  
- Pods → Smallest unit in Kubernetes  
- kube-system → Internal Kubernetes components  

---

## 🔄 Task 6: Cluster Lifecycle

kind delete cluster --name devops-cluster  
kind create cluster --name devops-cluster  
kubectl get nodes  

---

## 📁 kubeconfig

kubeconfig is a configuration file used by kubectl to connect to the Kubernetes cluster.

It contains cluster info, user credentials, and context.

Default location:  
~/.kube/config  

---

## ✅ Conclusion

Today I learned Kubernetes basics, architecture, and cluster setup using kind. I understood how Kubernetes manages containers and how its components work together. I also explored the cluster using kubectl and saw real components running as pods.
