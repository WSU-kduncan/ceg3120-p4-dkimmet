# Readme for Project 4

## Setup:

- [x] Create public repo per link in Pilot
- [x] Clone repo to your working environment (you should not need to use EC2 instances).
- [ ] Install [Docker for Desktop](https://www.docker.com/products/docker-desktop)
- [ ] Maybe: Install [AWS CLI](https://aws.amazon.com/cli/)

## Part 1: Milestone due 4/9

- [ ] Setup public repo via link in Pilot
- [ ] Dockerize your website and test locally
  - [ ] https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf
- [ ] Add site content & Dockerfile to repo

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
