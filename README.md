# CEG-3120: Project 4

## Project Overview

Although this final project seems complicated, it is easily broken down into the following significant steps.

- We used the website build from Project 3 and "Dockerized" it and tested it locally
- In combination with Amazon's ECR service and GitHub actions, we set up a workflow that pushed GitHub releases automatically to ECR.

**Tools Used:**

- Used aws cli to interact with ECR
- GitHub Repository secrets
- Yaml configuration file

## Run Project Locally

- **Installed Docker**
  - Installed through the arch repository
    - docker is disabled by default needed to run `sudo systemctl enable docker` and then `sudo systemctl start docker`
    - check status `systemctl status docker`
    - added my user to docker group with the following commands:
      - `getent group docker` shows the docker group and group ID
      - `whoami` double check my user name
      - `sudo gpasswd -a dayne docker` added user to docker group
- **Dockerized website and test locally**
  - Created docker file add the following lines
  -      FROM httpd:2.4
         # where from are your machine and where to on the container
         COPY ./html/ /usr/local/apache2/htdocs/
  - move to my CEG3120-P4-DKIMMET local folder
  - build docker image `docker build -t httptest .`
  - run `docker run -dit --name httptest -p 80:80 httptest` creates a repository called httptest
  - test by going to [docker test website](http://127.0.0.1/)
  - to stop docker `docker kill id`
  - start again `docker start httptest`
- **Configure AWS CLI**
  - Install cli version 2 by running the following commands
    -     curl "https://awscli.amazonaws.com awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
            unzip awscliv2.zip
            sudo ./aws/install
  - AWS IAM user with admin credentials
  - Use `aws configure` to enter the information needed that was provided to us on Pilot
- **Create ECR**
  - used the following command `aws ecr create-repository --repository-name ceg3120/myWSUID --region us-east-1`
- **Configure GitHub Secrets**
  - In the repositories settings Click on 'Secrets' and then click on the button 'New repository secret'
  - Add secrets named AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and used the information off of Pilot to fill in the 'Value'
- **Configure GitHub Workflow**
  - Created a new folder .github with a folder inside it called workflows.
  - Then created a docker-to-ecr-to-ecs.yml located inside the newly created workflows folder
    - changed the following variables from the ceg3120-p4-pattonsgirl template:
      - AWS_REGION: us-east-1
      - ECR_REPOSITORY: ceg3120/WSU_ID
      - CONTAINER_NAME: MY_CONTAINER_NAME

## Extra Credit - Docker Pull

- Pull docker image with the command: `docker image pull [OPTIONS] NAME[:TAG|@DIGEST]`
- Pulling from a public repo is just using the command above
- For a private repo you have to manually specify the path of the registry you wish to pull from. An example command would be `docker pull myregistry.local:5000/testing/test-image`
- run image locally
  - `docker pull ubuntu`
  - `docker run -it ubuntu`

## Resources:

- https://wiki.archlinux.org/index.php/Docker
- https://hub.docker.com/_/httpd
- https://docs.docker.com/engine/reference/run/
- https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
- https://docs.github.com/en/actions/guides/deploying-to-amazon-elastic-container-service
- https://docs.docker.com/engine/reference/commandline/pull/
