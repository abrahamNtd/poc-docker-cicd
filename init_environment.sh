#!/bin/bash

function init_volumenes {
	echo "Initialization for the volumes will start."

    mkdir -p ./volumes/sonarqube/data
	mkdir -p ./volumes/sonarqube/extensions
	mkdir -p ./volumes/sonarqube/logs
	mkdir -p ./volumes/postgresql/conf
	mkdir -p ./volumes/postgresql/data
	mkdir -p ./volumes/jenkins/jenkins_home
	mkdir -p ./volumes/prometheus
	mkdir -p ./volumes/prometheus/prometheus-data
	mkdir -p ./volumes/grafana/provisioning/datasources
	cp containers/jenkins/jenkins-configuration.yaml ./volumes/jenkins/jenkins_home/jenkins-configuration.yaml
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