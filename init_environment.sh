#!/bin/bash

function init_volumenes {
	echo "Initialization for the volumes will start."

    mkdir -p ./volumes/server/nginx/html/reports
    mkdir -p ./volumes/server/home
    mkdir -p ./volumes/sonarqube/data
	mkdir -p ./volumes/sonarqube/extensions
	mkdir -p ./volumes/sonarqube/logs
	mkdir -p ./volumes/postgresql/conf
	mkdir -p ./volumes/postgresql/data
	mkdir -p ./volumes/jenkins/jenkins_home
	mkdir -p ./volumes/jenkins/jenkins_home/.ssh
	mkdir -p ./volumes/prometheus
	mkdir -p ./volumes/prometheus/prometheus-data
	mkdir -p ./volumes/grafana/provisioning/datasources
	cp containers/jenkins/jenkins-configuration.yaml ./volumes/jenkins/jenkins_home/jenkins-configuration.yaml
	cp ssh/id_rsa ./volumes/jenkins/jenkins_home/.ssh/id_rsa
	cp ssh/id_rsa.pub ./volumes/jenkins/jenkins_home/.ssh/id_rsa.pub
	cp ssh/config ./volumes/jenkins/jenkins_home/.ssh/config
	cp code/reports/index.html ./volumes/server/nginx/html/reports/index.html
	cp containers/server/api_reports.json ./volumes/server/nginx/html/reports/api_reports.json
	cp containers/server/web_reports.json ./volumes/server/nginx/html/reports/web_reports.json
}

function delete_old_volumenes {
	if [ -d "./volumes/" ] 
	then
		echo "Directory ./volumes/ exists."
    	echo "Deleting old volumes"
		rm -rf ./volumes
	fi
}

clear
echo "This script requires to be on the root directory of the project."
echo "Together with the following files and directories:"
echo ""
echo "File        docker-compose.yml"
echo "Directory   volumes/"
echo ""
if [ $# == 1 ] && [ $1 == "-d" ]
then
	delete_old_volumenes
fi
init_volumenes
echo ""
ls -lt ./volumes
echo ""
echo "All the directories has been created"
echo "Now you can proced starting the containers"