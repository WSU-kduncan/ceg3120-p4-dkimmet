# CEG-3120: Project 4

## Setup:

- [x] Create public repo per link in Pilot
- [x] Clone repo to your working environment (you should not need to use EC2 instances).
- [x] Install [Docker for Desktop](https://www.docker.com/products/docker-desktop)
  - [x] installed through the arch repository (double check that this is the correct version)
  - [x] docker is disabled by default needed to run `sudo systemctl enable docker` and then `sudo systemctl start docker`
  - [x] check status `systemctl status docker`
  - [x] added my user to docker group with the following commands:
    - [x] `getent group docker` shows the docker group and group ID
    - [x] `whoami` double check my user name
    - [x] `sudo gpasswd -a dayne docker` added user to docker group
- ~~[ ] Maybe: Install [AWS CLI](https://aws.amazon.com/cli/)~~

## Resources:

- https://wiki.archlinux.org/index.php/Docker

## Part 1: Milestone due 4/9

- [x] Setup public repo via link in Pilot
- [x] Dockerize your website and test locally
  - [x] Created docker file add the following lines
  ```
  FROM httpd:2.4
  # where from are your machine and where to on the container
  COPY ./html/ /usr/local/apache2/htdocs/
  ```
  - [x] move to my CEG3120-P4-DKIMMET local folder
  - [x] build docker image `docker build -t httptest .`
  - [x] run `docker run -dit --name httptest -p 80:80 httptest`
  - [x] test by going to [docker test website](http://127.0.0.1/)
- [x] Add site content & Dockerfile to repo

---

---

---

---

## Part 2: Milestone due 4/16

- Set up with AWS CodeBuild, have return status be used of whether of not Dockerfile could be built.
- TODO: Add milestone deliverables

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
