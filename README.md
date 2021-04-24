# CEG-3120: Project 4

## Project Overview

Although this final project seems to be complicated it is easily broken down into the following major steps.

- We used are website build from Project 3 and "Dockerized" it and tested it locally
- In combination with Amazons ECR service and GitHub actions we setup a workflow that pushed GitHub releases automatically to ECR.
  **Tools Used:**
  - Used aws cli to interact with ECR
  - GitHub Repository secrets
  - Yaml configuration file

## Run Project Locally

Install [Docker for Desktop](https://www.docker.com/products/docker-desktop)

- Installed through the arch repository
  - docker is disabled by default needed to run `sudo systemctl enable docker` and then `sudo systemctl start docker`
  - check status `systemctl status docker`
  - added my user to docker group with the following commands:
    - `getent group docker` shows the docker group and group ID
    - `whoami` double check my user name
    - `sudo gpasswd -a dayne docker` added user to docker group
- Dockerized website and test locally
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
- Configure AWS CLI
  - Install cli version 2 by running the following commands
    -     curl "https://awscli.amazonaws.com awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
            unzip awscliv2.zip
            sudo ./aws/install
  - AWS IAM user with admin credentials
  - Use `aws configure` to enter the information needed that was provided to us on Pilot
- Create ECR
  - used the following command `aws ecr create-repository --repository-name ceg3120/myWSUID --region us-east-1`
- Configure GitHub Secrets
  - In the repositories settings Click on 'Secrets' and then click on the button 'New repository secret'
  - Add secrets named AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and used the information off of Pilot to fill in the 'Value'
- Configure GitHub Workflow
  - Created a new folder .github with a folder inside it called workflows.
  - Then created a docker-to-ecr-to-ecs.yml located inside the newly created workflows folder
    - changed the following variables from the ceg3120-p4-pattonsgirl template:
      - AWS_REGION: us-east-1
      - ECR_REPOSITORY: ceg3120/WSU_ID
      - CONTAINER_NAME: MY_CONTAINER_NAME

## Resources:

- https://wiki.archlinux.org/index.php/Docker
- https://hub.docker.com/_/httpd
- https://docs.docker.com/engine/reference/run/

## Extra Credit - Docker Pull

- Documentation to perform the following:
  - How to pull image with `docker pull`, what repo is the image in, requirements of the repo (public vs. private)
  - Run the pulled image locally, using your system or a system on AWS as the host.

## Extra Credit - [Docke]Rise of the Discord Bot

- Dockerize your python bot - place in repo in folder named `Discord-Bot`
  - Add instructions to handle API key from Discord. Maybe have a docker copy that gets a .env file from their path (this need to exist to build and run image)
  - Your API key may be the most challenging piece of this project extra credit. GitHub secrets might be handy.
  - Be sure to site your sources if you model off of an example / other documentation

## Submission

In your GitHub repository, select the green `Code` button then select `Download ZIP`. Upload this zip file to Pilot.

In the `Comment` area in the Pilot Dropbox, copy URL / link to the repository corresponding to the project you are submitting
