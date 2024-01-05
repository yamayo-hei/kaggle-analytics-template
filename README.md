## description
The discription of this competition is [here](https://www.kaggle.com/competitions/{competition}/overview).

## Hardware
- Google Cloud Platform
    - OS: **Ubuntu**
    - GPU(default): **nvidia t4**
    - machine type(default): **n1-standard-1**

## required applications
|  application  |  version  |  confirmation command  |
| ----------- | ------- | ------- |
|  gcloud SDK  |  >= 446.0.0  | gcloud --version |
|  terraform  |  >= v1.5.7  | terraform --version |

*************************************************************************************************************************

# 1. Set up 
**※This is only first time**

## 1-1. Advance preparation
1. create a git repository from this repository template ([> How to create repository from template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template))
2. clone to your local machine
3. fix the following files

|  File path  |  Fixes  |
| ----------- | ------- |
|  docker/docker-compose.yml  |  fix container name.(default is _kaggle_)  |
|  docker/docker-compose.yml  |  fix token value.(default is _kaggle-token_)  |
|  README.md  |  put a value in the `{competition}`.  |
|  README.md  |  put a value in the `{clone_url}`.  |
|  README.md  |  put a value in the `{repository_name}`.  |
|  README.md  |  put a value in the `{instance_name}`.  |
|  README.md  |  put a value in the `{zone}`.  |

4. Push to remote

## 1-2. Set up GCP VM Instance
1. If not exists, create your GCP account.
2. In GCP
    - create service account key and download private key(json file).
    - request the following quotas increase. (Approval takes about 1 hour)
        - NVIDIA T4 GPUs
        - GPUs (all regions)
3. In your local terminal
    - change directory to {repository_name}/iac/
    - change each setting value in variable.tf
    - execute following command
       ```
       gcloud init
       terraform init
       terraform plan
       terraform apply
       ```
    - ssh connect
       ```
       gcloud compute ssh {instance_name} --tunnel-through-iap --zone={zone}
       ```

4. In VM Instance
    - generate SSH key
      ```
      ssh-keygen
      ```
    - copy below command result to github setting
      ```
      cat ~/.ssh/id_rsa.pub
      ```
    - register output to your git hub account.
    - git clone
       ```
       git clone {clone_url}
       ```
    - [Install nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-apt)
    - Install nvidia driver
      ```
        sudo apt install ubuntu-drivers-common
        ubuntu-drivers devices
        sudo apt -y install nvidia-driver-{recommended version}
        sudo reboot
      ```
    - docker build
      ```
      cd enefit-predict/docker
      docker compose up --build
      ```
# 2. Start
## 2-1. Start VM Instance
1. If the VM Instance is not ready, start the VM Instance in GCP.
## 2-2. Open Jupyter
2. Open following link In your browser.
   - http://{IP address}:8888/lab?token=kaggle-token

# 3. Shutdown
## 3-1. Shutdown VM Instance
1. Stop the VM Instance in GCP.

*************************************************************************************************************************

# theme 1

## Feature Engineering
Please run the following notebooks in th ./feature
- feature001_xxx.ipynb
- feature002_xxx.ipynb
- feature003_xxx.ipynb

## Training
Please run the following notebooks in th ./learn
- learn001_xxx.ipynb
- learn002_xxx.ipynb
- learn003_xxx.ipynb

# theme 2

## Feature Engineering
Please run the following notebooks in th ./feature
- feature001_xxx.ipynb
- feature002_xxx.ipynb
- feature003_xxx.ipynb

## Training
Please run the following notebooks in th ./learn
- learn001_xxx.ipynb
- learn002_xxx.ipynb
- learn003_xxx.ipynb
