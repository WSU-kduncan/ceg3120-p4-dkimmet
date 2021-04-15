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

~~- [ ] Set up ECR on AWS educate account~~

- [x] Create GitHub Actions secrets named AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to store the values for your Amazon IAM access key
- [x] Set up GitHub workflow that pushes image to ECR, comment out ECS related sections
  - Using workflow templated here: https://docs.github.com/en/actions/guides/deploying-to-amazon-elastic-container-service
- [x] Instructions to configure AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
  - You will need AWS CLI so that you can interact with an account that _can_ use ECR and ECS (I disabled your ability to log into the web interface using these credentials)
  - Credential notes are located in Pilot -> Content -> Projects
  - Create ECR Repository from CLI:
    - Replace `w###aaa` with your w# so we can tell things apart
    - `aws ecr create-repository --repository-name ceg3120/w###aaa --region us-east-1`

## Part 3: Milestone due 4/23

- If success, get AWS AMI credentials (GitHub Secrets), upload container to ECR
- Update ECS to use new container
- TODO: Add milestone deliverables

## Extra Credit:

- Dockerize your python bot
  - Will require use of GitHub Secrets to protect the API key
  - This guide has a parallel example with some things to consider
    - https://aws.amazon.com/blogs/containers/create-a-ci-cd-pipeline-for-amazon-ecs-with-github-actions-and-aws-codebuild-tests/

## Submission

In your GitHub repository, select the green `Code` button then select `Download ZIP`. Upload this zip file to Pilot.

In the `Comment` area in the Pilot Dropbox, copy URL / link to the repository corresponding to the project you are submitting

```

```
