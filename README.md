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
