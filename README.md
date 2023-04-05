# poc-docker-cicd

1 Description

This project explains how to implement a local CI/CD environment for testing and learning purposes. By no means it can be considered a production-ready environment although it has most of the necessary tools.

This is a simple POC using Docker Compose to facilitate the implementation.

The following are considered in this POC

Whenever possible the tool is configured like a productive one.
It is based on open-source projects
It is considered a basic use case (front end and backend)
The main enfaces are on the CI/CD process and DevOps
The pipeline intends to include the most common stages and quality gates.
As part of this implementation monitoring logs and reporting solution are set.


2 Preparing the environment. 

The first time the project runs on the computer you should run the script "init_environment.sh" so the necessary directories be created, as follows:

chmod +x init_environment.sh
./init_environment.sh -d

After running the script the directories structure should look like this:

ls -lt

README.md
docker-compose.yml
code
commands.txt
volumes
containers
init_environment.sh
ssh

3 Running the project 

After setting the environment, on the root directory of the project (Where the docker-compose file is located), you must run the following command to start the project :

docker compose build

docker compose up -d

Now if everything was ok you should be able to see the homepage on your browser 

http://localhost:8080/

To stop the project you should run the following command:

docker compose down --volumes

4 First Time using the project

4.1 Home

4.2 Jenkins

4.3 Sonar

After login for the first time to sonar you should change your password from "admin" to "ADMIN" 
