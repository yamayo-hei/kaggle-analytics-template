# description
The discription of this competition is [here](https://www.kaggle.com/competitions/{competition}/overview).

# Hardware
- Google Cloud Platform
    - Ubuntu
    - n1-standard-1 (default)

# required applications
## application list
|  application  |  version  |
| ----------- | ------- |
|  gcloud SDK  |  >= 446.0.0  |
|  terraform  |  >= v1.5.7  |

## Make sure the required applications are installed
   ```
   gcloud --version
   terraform --version
   ```

# Data download
Download data to ./input/ from https://www.kaggle.com/competitions/{competition}/data .

# (first time only)Set up

## Advance preparation
1. create a git repository from this repository template
2. clone to your local machine
3. fix the following files

|  File path  |  Fixes  |
| ----------- | ------- |
|  docker/docker-compose.yml  |  put a value in the `{container_name}`.  |
|  docker/docker-compose.yml  |  fix token value.(default is _kaggle-token_)  |
|  README.md  |  put a value in the `{competition}`.  |
|  README.md  |  put a value in the `{clone_url}`.  |
|  README.md  |  put a value in the `{repository_name}`.  |
|  README.md  |  put a value in the `{instance_name}`.  |
|  README.md  |  put a value in the `{zone}`.  |

## set up GCP VM instance
1. If not exists, create your GCP account.
2. In GCP, create service account key and download private key(json file).
3. open your terminal.
4. change directory to ./iac/
5. fix the following files.

|  File path  |  Fixes  |
| ----------- | ------- |
|  iac/variable.tf  |  fix each variables.  |

6. gcloud init
   ```
   gcloud init
   ```
7. execute terraform command
   ```
   terraform init
   terraform plan
   terraform apply
   ```

## set up jupyter server in VM instance
1. ssh connect
   ```
   gcloud compute ssh {instance_name} --tunnel-through-iap --zone={zone}
   ```

2. change root password
   ```
   sudo passwd root
   ```
3. generate SSH key
   1. generate ssh key
      ```
      ssh-keygen
      ```
   2. copy below command result to github setting
      ```
      cat ~/.ssh/id_rsa.pub
      ```
   3. register output to your git hub account.
4. git clone
   ```
   git clone {clone_url}
   ```
5. docker build
   1. change directory to docker
      ```
      cd {repository_name}/docker
      ```
   2. docker build
      ```
      sudo docker-compose up --build
      ```

# (every time)Set up
1. opne your local terminal.
2. SSH port forwarding
   ```
   gcloud compute ssh {instance_name} --tunnel-through-iap -N -f -L 8888:localhost:8888
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
