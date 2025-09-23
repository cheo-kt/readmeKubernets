# readmeKubernets

## Sergio Fernando Florez Sanabria A00396046


## Prerequisites

- Azure subscription  
- Azure CLI installed (`az`)  
- Terraform installed (`terraform`)  
- `kubectl` installed  
- Lens installed on Windows  

---

## Steps

### 1. Authenticate with Azure
```bash
az login
````

Make sure your subscription is selected:

```bash
az account set --subscription "<your-subscription-id>"
```

---

### 2. Clone the repository

```bash
git clone https://github.com/cheo-kt/readmeKubernets.git
cd readmeKubernets
```

---

### 3. Terraform configuration files

The main files are:

* `main.tf` → Defines Azure resources (Resource Group + AKS cluster)
* `versions.tf` → Specifies Terraform and provider versions
* `README.md` → Documentation

---

### 4. Initialize Terraform

```bash
terraform init
```

---

### 5. Plan infrastructure

```bash
terraform plan -out plan.tfplan
```

---

### 6. Apply the plan

```bash
terraform apply plan.tfplan
```

This step may take **5–10 minutes** while Azure provisions the AKS cluster.

---

### 7. Get AKS credentials

```bash
az aks get-credentials --resource-group aks_sergioflorez_resource_group_plataformas --name myAKSCluster
```

Verify the nodes:

```bash
kubectl get nodes
```

---

### 8. Deploy a test application (optional)

```bash
kubectl create deployment my-nginx --image=nginx
kubectl expose deployment my-nginx --port=80 --type=LoadBalancer
kubectl get service my-nginx
```

Copy the **EXTERNAL-IP** and test it in the browser:

```
http://<EXTERNAL-IP>
```

---

### 9. Connect AKS cluster to Lens (Windows)

Since the cluster was created in **Ubuntu (WSL)**, we need to copy the kubeconfig file to Windows:

```bash
cp ~/.kube/config /mnt/c/Users/<your-user>/config-aks
```

Then in Lens:

1. Open **Lens**
2. Go to **File → Add Cluster**
3. Select the file `C:\Users\<your-user>\config-aks`
4. The cluster will appear in Lens with full access

---

## Notes

* The `.terraform/` directory and provider binaries should not be committed to Git. Use a `.gitignore` file to exclude them.
* GitHub has a **100 MB file size limit**, so never push provider binaries.

---

## Repository Structure

```
readmeKubernets/
│-- main.tf
│-- versions.tf
│-- README.md
│-- .gitignore
```


## photos

<img width="1600" height="846" alt="image" src="https://github.com/user-attachments/assets/2e4c6cb3-abc5-4ce1-87e4-f64ef8a353f4" />

<img width="1600" height="863" alt="image" src="https://github.com/user-attachments/assets/120327ee-dc9d-4ba3-803b-d8ab4e8e4a59" />
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/dc720a86-e655-40f3-9a5c-39bb446dd10e" />



