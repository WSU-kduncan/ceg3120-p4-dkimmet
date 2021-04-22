# CEG-3120: Project 4

## Setup:

- [x] Create public repo per link in Pilot
- [x] Clone repo to your working environment (you should not need to use EC2 instances).
- [x] Install [Docker for Desktop](https://www.docker.com/products/docker-desktop)
  - installed through the arch repository (double check that this is the correct version)
  - docker is disabled by default needed to run `sudo systemctl enable docker` and then `sudo systemctl start docker`
  - check status `systemctl status docker`
  - added my user to docker group with the following commands:
    - `getent group docker` shows the docker group and group ID
    - `whoami` double check my user name
    - `sudo gpasswd -a dayne docker` added user to docker group
- [x] Maybe: Install [AWS CLI](https://aws.amazon.com/cli/)

## Resources:

- https://wiki.archlinux.org/index.php/Docker

## Part 1: Milestone due 4/9

- [x] Setup public repo via link in Pilot
- [x] Dockerize your website and test locally
  - Created docker file add the following lines
  ```
  FROM httpd:2.4
  # where from are your machine and where to on the container
  COPY ./html/ /usr/local/apache2/htdocs/
  ```
  - move to my CEG3120-P4-DKIMMET local folder
  - build docker image `docker build -t httptest .`
  - run `docker run -dit --name httptest -p 80:80 httptest` creates a repository called httptest
  - test by going to [docker test website](http://127.0.0.1/)
  - to stop docker `docker kill id`
  - start again `docker start httptest`
- [x] Add site content & Dockerfile to repo

## Resources:

- https://hub.docker.com/_/httpd
- https://docs.docker.com/engine/reference/run/

---

## Part 2: GitHub Actions & ECR - Milestone due 4/17

- [x] Instructions to configure AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
  - You will need AWS CLI so that you can interact with an account that _can_ use ECR and ECS (I disabled your ability to log into the web interface using these credentials)
  - Credential notes are located in Pilot -> Content -> Projects
  - Create ECR Repository from CLI:
    - Replace `w###aaa` with your w# so we can tell things apart
    - `aws ecr create-repository --repository-name ceg3120/w###aaa --region us-east-1`
- [x] Create GitHub Actions secrets named AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY using info in Pilot page.
- [x] Set up GitHub workflow that pushes image to ECR, comment out ECS related sections
  - Using workflow templated here: https://docs.github.com/en/actions/guides/deploying-to-amazon-elastic-container-service

## Part 3: Documentation - Milestone due 4/23
### Documentation requirements using ECR
- Create `README.md` in main folder of your repo that details the following:
    - Project Overview
    - Run Project Locally
        - how you installed docker + dependencies (WSL2, for example)
        - how to build the container
        - how to run the container
        - how to view the project (open a browser...go to ip and port...)
    - Configure AWS CLI
        - need AWS IAM user with admin credentials
        - how you installed
        - how to configure
    - Create ECR
        - command to create
    - Configure GitHub Secrets
        - need AWS IAM user with admin credentials
        - set secrets and secret names
    - Configure GitHub Workflow
        - variables to change (AWS_REGION, etc.) 

## Extra Credit - Docker Pull
- Documentation to perform the following:
    - How to pull image with `docker pull`, what repo is the image in, requirements of the repo (public vs. private)
    - Run the pulled image locally, using your system or a system on AWS as the host.

## Extra Credit - [Docke]Rise of the Discord Bot
- Dockerize your python bot - place in repo in folder named `Discord-Bot`
    - Add instructions to handle API key from Discord.  Maybe have a docker copy that gets a .env file from their path (this need to exist to build and run image)
    - Your API key may be the most challenging piece of this project extra credit.  GitHub secrets might be handy.
    - Be sure to site your sources if you model off of an example / other documentation

## Submission

In your GitHub repository, select the green `Code` button then select `Download ZIP`. Upload this zip file to Pilot.

In the `Comment` area in the Pilot Dropbox, copy URL / link to the repository corresponding to the project you are submitting

## Documenting Rabbit Holes
This section is notes on what has needed to be modified over the course of this project.
- Cannot authenticate on AWS CLI with EDU account credentials
        - You can't make an IAM user, so you'll need to pull up yours, see below
    - How to get IAM user credentials
        - Sign in to AWS Educate, click our classroom - don't click AWS Console
        - Click other blue button for account details.  In here, you'll find the credentials for AWS CLI
    - Guide update incoming
- Verify services are actually available before using again: 
    - https://awseducate-starter-account-services.s3.amazonaws.com/AWS_Educate_Starter_Account_Services_Supported.pdf

- Using this as resource created below: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-cli-tutorial-ec2.html
- ~~Create EC2 Key Pair~~ - if using EC2 Deployment
    - Remember, you're on my AWS, so you'll need this key for a future step - specifically remember the key-name value
    - `aws ec2 create-key-pair --key-name w###aaa --query 'KeyMaterial' --output text > aws-w###aaa.pem`
    - Change permssions: `chmod 400 aws-w###aaa.pem`
- ~~Create ECS cluster~~ - if using EC2 Deployment
    - `ecs-cli configure --cluster cluster-w###aaa --default-launch-type EC2 --config-name cluster-w###aaa --region us-east-1`
    - `ecs-cli up --keypair w###aaa --capability-iam --size 2 --instance-type t2.small --cluster-config cluster-w###aaa`
        - If you mess up and need to re-run, add `--force` at the end of the command to have it replace the old with the new
    - What about security groups and ports?
        - By default, the security group created for your container instances opens port 80 for inbound traffic
        - Convenient, moving on.  If this was not the case, would need `--security-group` parameter and set additional options

- Install ECS CLI Tools (this is in addition to AWS CLI)
    - [Link to install guide](https://docs.amazonaws.cn/en_us/AmazonECS/latest/developerguide/ECS_CLI_installation.html)
    - Linux commands:
        - `sudo curl -Lo /usr/local/bin/ecs-cli https://s3.cn-north-1.amazonaws.com.cn/amazon-ecs-cli/ecs-cli-linux-amd64-latest`
        - `sudo chmod +x /usr/local/bin/ecs-cli`
- Create ECS cluster
    - `ecs-cli configure --cluster ecs-w###aaa --default-launch-type FARGATE --config-name ecs-w###aaa --region us-east-1`
    - `ecs-cli up --cluster-config ecs-w###aaa`
- Create ECS service
- Create ECS Task Definition
- Modify workflow to use GitHub Actions to auto deploy
- In your workflow, `ECS_CLUSTER` = ecs-w###aaa per what you created above
