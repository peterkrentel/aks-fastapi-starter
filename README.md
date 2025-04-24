# aks-fastapi-starter

# Prerequisites
Azure account – with permission to create resources.

Azure CLI – installed & logged in:

az login

kubectl – to interact with your AKS cluster.

Docker – to containerize your FastAPI app.

(Optional) GitHub or CI/CD pipeline for automation.

#Step 1: Build Your FastAPI App
Here’s a minimal FastAPI app (main.py):
'''
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from AKS!"}

'''

# Step 2: Dockerize the App
Create DOCKERFILE
`
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

COPY ./main.py /app/main.py

`

Then build & tag the image:
```
docker build -t yourdockerhubusername/fastapi-app:v1 .
```

# Create a resource group
az group create --name fastapi-rg --location eastus

# Create the AKS cluster
az aks create \
  --resource-group fastapi-rg \
  --name fastapi-cluster \
  --node-count 1 \
  --enable-addons monitoring \
  --generate-ssh-keys

# Get AKS credentials to use kubectl
az aks get-credentials --resource-group fastapi-rg --name fastapi-cluster

# Step 4: Create Kubernetes Deployment & Service
Create a deployment.yaml:

'''
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fastapi-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: fastapi
  template:
    metadata:
      labels:
        app: fastapi
    spec:
      containers:
      - name: fastapi
        image: yourdockerhubusername/fastapi-app:v1
        ports:
        - containerPort: 80

'''