# Advance preparation
1. create repository from this template repository
2. fix container_name at docker-compose.yml
3. fix token at docker-compose.yml
4. fix README.md(delete "Advance preparation" part)

# description
The discription of this competition is [here](https://www.kaggle.com/competitions/{competition}/overview).

# Hardware
- Google Cloud Platform
    - Debian 10.12
    - a2-highgpu-1g (vCPU x 12, memory 85 GB)
    - 1 x NVIDIA Tesla A100

# Data download
Download data to ./input/ from https://www.kaggle.com/competitions/{competition}/data .

# (first time only)Set up

## SSH Terminal on a browser
1. change root password
   ```
   sudo passwd root
   ```
2. change timezone
   ```
   sudo timedatectl set-timezone Asia/Tokyo
   ```
3. apt update
   ```
   sudo apt update
   sudo apt upgrade
   ```
5. SSH key
   1. generate ssh key
      ```
      ssh-keygen
      ```
   2. copy below command result to github setting
      ```
      cat ~/.ssh/id_rsa.pub
      ```
6. git
   1. install
      ```
      sudo apt install git
      ```
   2. clone
      ```
      git clone {clone_url}
      ```
   3. change directory to docker
      ```
      cd {repository_name}/docker
      ```
   4. docker build
      ```
      docker-compose up --build
      ```

## Local
1. Init
   ```
   gcloud init
   ```
2. 
   ```
   gcloud compute ssh {instance_name} -- -N -f -L 8888:localhost:8888
   ```

## 

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
