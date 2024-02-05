# 0. Overview
### description of this repository
This template is to create kaggle env on GCP.

### required applications
|  application  |  version  |  confirmation command  |
| ----------- | ------- | ------- |
|  gcloud SDK  |  >= 446.0.0  | gcloud --version |
|  terraform  |  >= v1.5.7  | terraform --version |

*************************************************************************************************************************

# 1. Set up 
**※This step is only first time**

### 1-1. Advance preparation
1. create a git repository from this repository template ([> How to create repository from template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template))
2. clone to your local machine
3. fix the following files

|  File path  |  Fixes  |
| ----------- | ------- |
|  docker/docker-compose.yml  |  fix container name.(default is _kaggle_)  |
|  docker/docker-compose.yml  |  fix token value.(default is "")  |

1. Push to remote

### 1-2. Build container
1. In VM Instance
   - git clone (take more than one hour)
   ```
   git clone {clone_url}
   cd {repository_name}/src
   ```
   - docker build (take more than one hour)
   ```
   docker compose up --build
   ```
# 2. Start
### 2-1. Start VM Instance
1. If the VM Instance is not ready, start the VM Instance in GCP.
### 2-2. Open Jupyter
1. Open following link In your browser.
   - http://{IP address}:8888/lab?token=kaggle-token

# 3. Shutdown
### 3-1. Shutdown VM Instance
1. Stop the VM Instance in GCP.

*************************************************************************************************************************

# 4. Your work
### 4-1. XXXXX
### 4-2. XXXXX
### 4-3. XXXXX
