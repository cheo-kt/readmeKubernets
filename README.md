# readmeKubernets

## Sergio Fernando Florez Sanabria A00396046






---

### 📝 README Detallado: Creación de Cluster AKS

````markdown
# AKS Cluster Deployment - Sergio Florez

This document describes the step-by-step process of creating a basic Azure Kubernetes Service (AKS) cluster, deploying a sample Nginx application, and verifying its functionality.

---

## 1. Prerequisites

- Azure subscription
- Azure CLI installed (`az`)
- Ubuntu machine or terminal
- Access to install `kubectl`

---

## 2. Step 1: Login to Azure

Login to your Azure account using:

```bash
az login
````

If no browser is available:

```bash
az login --use-device-code
```

---

## 3. Step 2: Create Resource Group

Create a resource group for the AKS cluster:

```bash
az group create --name aks_sergioflorez_resource_group_plataformas --location eastus
```

> **Note:** Resource group is a container for all Azure resources.

---

## 4. Step 3: Create AKS Cluster

Create the AKS cluster with 1 node and monitoring enabled:

```bash
az aks create \
  --resource-group aks_sergioflorez_resource_group_plataformas \
  --name myAKSCluster \
  --node-count 1 \
  --enable-addons monitoring \
  --generate-ssh-keys
```

> **Expected time:** \~5-10 minutes for the cluster to be provisioned.

---

## 5. Step 4: Connect to the Cluster

Configure `kubectl` to connect to your AKS cluster:

```bash
az aks get-credentials --resource-group aks_sergioflorez_resource_group_plataformas --name myAKSCluster
```

> You should see:

```
Merged "myAKSCluster" as current context in /home/sergio/.kube/config
```

---

## 6. Step 5: Install kubectl (if not installed)

If `kubectl` is missing:

```bash
sudo snap install kubectl --classic
```

Verify installation:

```bash
kubectl version --client
```

---

## 7. Step 6: Verify Cluster Nodes

Check that the node is ready:

```bash
kubectl get nodes
```

Expected output: your node should be listed and in `Ready` state.

---

## 8. Step 7: Deploy a Test Application (Nginx)

Create the deployment:

```bash
kubectl create deployment my-nginx --image=nginx
```

Expose the deployment as a LoadBalancer service:

```bash
kubectl expose deployment my-nginx --port=80 --type=LoadBalancer
```

Check the service:

```bash
kubectl get service my-nginx
```

You should see something like:

| NAME     | TYPE         | CLUSTER-IP | EXTERNAL-IP     | PORT(S)      | AGE |
| -------- | ------------ | ---------- | --------------- | ------------ | --- |
| my-nginx | LoadBalancer | 10.0.70.5  | 172.210.127.141 | 80:31392/TCP | 30s |

> Open `http://172.210.127.141` in your browser to see the Nginx welcome page.

---
<img width="1600" height="771" alt="image" src="https://github.com/user-attachments/assets/7f6f3a75-85e3-4660-8382-109451f8ac83" />

## 9. Step 8: Verify in Azure Portal

* Go to [Azure Portal](https://portal.azure.com) → Kubernetes services.
* Your cluster `myAKSCluster` should appear.
* Nodes, monitoring, and configuration can be checked here.
* Note: Nginx LoadBalancer IP is only visible via `kubectl`.

---

## 10. Step 9: Clean Up Resources

To delete the cluster and all related resources:

```bash
az group delete --name aks_sergioflorez_resource_group_plataformas --yes --no-wait
```

---

## 11. Notes / Common Issues

* `kubectl not found`: solved by installing with snap or apt.
* `EXTERNAL-IP <pending>`: wait a few minutes for Azure to assign a public IP.
* Cluster creation can take up to 10-15 minutes depending on region and Azure load.

---
<img width="1600" height="613" alt="image" src="https://github.com/user-attachments/assets/ec347bbe-c276-4146-8e66-448789750469" />


##**12. Azure page**
<img width="1600" height="856" alt="image" src="https://github.com/user-attachments/assets/ed0b5c19-ca64-4825-9d79-a64a3391ffac" />
<img width="1600" height="852" alt="image" src="https://github.com/user-attachments/assets/31db761a-b240-4b97-ab26-76db57d560f0" />


## 13. References

* [Azure AKS Documentation](https://learn.microsoft.com/en-us/azure/aks/)
* [Kubernetes Documentation](https://kubernetes.io/docs/)

```


