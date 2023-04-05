#!/usr/local/bin/python3

import json
import sys

def updateJson(file_name, report_type, report_name):
	new_report = {"type": report_type,"name": report_name}
	with open(file_name, 'r') as json_file:
		json_data = json.load(json_file)

	new_report = {"type":report_type, "name":report_name}
	json_data.append(new_report)

	with open(file_name, 'w') as json_file:
		json.dump(json_data, json_file)

if __name__ == '__main__':
	file_name = '/usr/share/nginx/html/reports/' + sys.argv[1] #"api_reports.json"
	report_type = sys.argv[2] #"Unit Test"
	report_name = sys.argv[3] #"test_01.html"
	updateJson(file_name, report_type, report_name)

