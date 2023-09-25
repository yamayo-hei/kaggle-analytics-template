# Advance preparation
- create repository from this template repository
- fix container_name at docker-compose.yml
- fix token at docker-compose.yml
- fix README.md(delete "Advance preparation" part)

# description
The discription of this competition is [here](https://www.kaggle.com/competitions/{competition}/overview).

# Hardware
- Google Cloud Platform
    - Debian 10.12
    - a2-highgpu-1g (vCPU x 12, memory 85 GB)
    - 1 x NVIDIA Tesla A100

# Data download
Download data to ./input/ from https://www.kaggle.com/competitions/{competition}/data .

# Environment

## SSH Terminal on a browser
1. (first time only) change root password
   ```
   sudo passwd root
   ```
2. (first time only) change timezone
   ```
   sudo timedatectl set-timezone Asia/Tokyo
   ```
3. (first time only) apt update
   ```
   sudo apt update
   sudo apt upgrade
   ```
5. (first time only) git install
   ```
   sudo apt install git
   ```

## Local
1. (first time only) Init
   ```
   gcloud init
   ```
2. 
   ```
   gcloud compute ssh {instance_name} -- -N -f -L 8888:localhost:8888
   ```

## 
- change directory to docker
```
cd docker
```
- build
```
docker-compose up --build
```

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
