# 🚀 Day 66 — EKS Cluster using Terraform (Detailed Theory)

---

## 📌 Introduction

Is task me humne AWS par **EKS (Elastic Kubernetes Service)** cluster ko Terraform ke through automate kiya.
Manual setup ke instead, humne Infrastructure as Code (IaC) use kiya — jisse infra repeatable, scalable aur manageable ho jata hai.

---

## 📁 Task 1: Project Setup (Theory)

Project structure ka main purpose hai **code ko organized rakhna**.

### 🔹 Why separate files?

* `providers.tf` → providers define karta hai (AWS, Kubernetes)
* `vpc.tf` → networking (VPC, subnets)
* `eks.tf` → cluster creation
* `variables.tf` → dynamic inputs
* `outputs.tf` → important outputs
* `terraform.tfvars` → actual values
* `k8s/` → Kubernetes YAML files

👉 Isse readability aur maintainability improve hoti hai

---

## 🌐 Task 2: VPC Creation (Theory)

### 🔹 What is VPC?

VPC (Virtual Private Cloud) ek **isolated network** hota hai AWS ke andar jahan hum apna infra run karte hain.

---

### 🔹 Why EKS needs VPC?

Kubernetes cluster ko:

* Networking
* Communication between nodes
* Internet access

ke liye VPC required hota hai

---

### 🔹 Public vs Private Subnets

| Type           | Use                                      |
| -------------- | ---------------------------------------- |
| Public Subnet  | Internet-facing resources (LoadBalancer) |
| Private Subnet | Worker nodes (secure environment)        |

👉 Nodes private subnet me hote hain for security
👉 LoadBalancer public subnet me hota hai for access

---

### 🔹 NAT Gateway

Private subnet ke resources internet access nahi kar sakte
👉 NAT Gateway unhe **outbound internet access** deta hai

---

### 🔹 Subnet Tags (VERY IMPORTANT)

```
kubernetes.io/role/elb = 1
kubernetes.io/role/internal-elb = 1
```

👉 Ye tags AWS ko batate hain:

* Kahan external LoadBalancer banana hai
* Kahan internal services run karni hain

❗ Agar ye missing ho → LoadBalancer pending me rahega

---

## ⚙️ Task 3: EKS Cluster Creation (Theory)

### 🔹 What is EKS?

Amazon EKS ek **managed Kubernetes service** hai
👉 AWS control plane manage karta hai
👉 Hum sirf worker nodes aur workloads manage karte hain

---

### 🔹 Why use Terraform module?

* Pre-built logic
* Time saving
* Best practices included
* 30+ resources automatically create

---

### 🔹 Cluster Components

1. **Control Plane**

   * Managed by AWS
   * API server, scheduler, etc.

2. **Node Group**

   * EC2 instances
   * Containers run here

3. **IAM Roles**

   * Permissions for cluster & nodes

4. **Security Groups**

   * Network security

---

### 🔹 Node Group Concept

* `min_size` → minimum nodes
* `max_size` → maximum scaling
* `desired_size` → current nodes

👉 Auto-scaling possible hota hai

---

## 🚀 Task 4: Apply & Connect kubectl (Theory)

### 🔹 terraform apply

* Terraform AWS par resources create karta hai
* State file maintain hoti hai
* 10–15 min lagte hain (EKS slow hota hai)

---

### 🔹 kubeconfig kya hai?

* kubectl ko batata hai:

  * cluster ka endpoint
  * authentication details

👉 Command:

```
aws eks update-kubeconfig
```

---

### 🔹 Verification

* `kubectl get nodes` → nodes ready?
* `kubectl get pods -A` → system pods running?
* `kubectl cluster-info` → cluster accessible?

---

## 🌐 Task 5: Deploy Nginx (Theory)

### 🔹 What is Deployment?

Deployment ek Kubernetes object hai jo:

* Pods create karta hai
* Scaling manage karta hai
* Updates handle karta hai

👉 `replicas: 3` → 3 pods run honge

---

### 🔹 What is Service?

Service ek abstraction hai jo pods ko expose karta hai

Types:

* ClusterIP (default)
* NodePort
* LoadBalancer ⭐

---

### 🔹 LoadBalancer in EKS

* AWS automatically ELB create karta hai
* Public IP assign hota hai
* Internet se accessible ho jata hai

---

### 🔹 Flow samajh:

User → LoadBalancer → Service → Pods

---

## 🧹 Task 6: Destroy (Theory)

### 🔹 Why destroy important?

AWS resources cost lete hain:

* EC2
* NAT Gateway
* Load Balancer

👉 Isliye cleanup zaroori hai

---

### 🔹 Order important hai

1. Kubernetes resources delete:

```
kubectl delete -f nginx-deployment.yaml
```

2. Terraform destroy:

```
terraform destroy
```

---

### 🔹 Agar skip kiya toh?

* LoadBalancer delete nahi hoga
* VPC delete fail ho jayega
* Charges continue rahenge

---

## 📊 Key Learnings

* Infrastructure as Code (IaC) real-world DevOps practice hai
* Terraform modules complex setup ko easy bana dete hain
* Subnet tagging critical hai for EKS
* LoadBalancer AWS networking pe depend karta hai
* Proper destroy karna equally important hai

---

## 🔥 Final Conclusion

Is task me humne:

* Terraform se EKS cluster create kiya
* Kubernetes workload deploy kiya
* AWS LoadBalancer use kiya
* Complete infra ko clean destroy kiya

👉 Ye pura workflow real-world production DevOps ka base hai

---

#90DaysOfDevOps #TerraWeek #DevOps #AWS #Terraform #Kubernetes

