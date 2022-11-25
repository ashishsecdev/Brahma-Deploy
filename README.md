# Brahma-Deploy: The Creator (MVP)

Idea for Brahma Deploy has come from my love for automation and Cloud technologies.

Currently, it's a very small-scale product that enables you to deploy fully operational Ansible cluster in GCP using Terraform. You can create plays using Ansible to deploy the other components.

If you want to develop it at scale then you can use this project as your playground. I am releasing it as a open source community driven project and looking forward to your contributions.


# ब्रह्मा Brahma(Hindu God) also called “the Creator” is considered to be the creator of this entire universe.

That's why calling it Brahma Deploy 

![Brahma Deploy](https://github.com/ashishsecdev/Brahma-Deploy/blob/main/Brahma-Gui.PNG)


## Purpose

It can solve multiple challenges for Devops, Cloud and Detection teams.

* You can straight away use GUI option to deploy the Ansible Cluster in Cloud.
* One-click deployment of infrastructure components in different cloud environments.
* Detection teams ca deploy Sandboxes to simulate real-time attack and test your SIEM rules.
* Solopreneurs or smaller teams can use GUI option to launch the cloud resources without much learning curve.
* Create Terraform templates to deploy one click open-source tool like Wazuh, Osquery, velociraptor etc.
* ‘Create’ and ‘destroy’ your own sandboxes in seconds.

## Components Involved
* Python script terra-exec.py that executes the Python terraform module from GUI.
* Badly Made frontend in HTML and backend in PHP. :-P (Sorry, didn’t had time)
* Terraform Scripts for infrastructure deployment.
* Bash scripts for setting up Ansible Master/Controller and Nodes.
* CSP Provider & account credentials.



## Setup
Cloud Service Provider

* Provide account key as per 'account_key.json'.
* Provide user password as per "account_password" in Ansible_Master and Ansible_node.sh
* Update 'Provide.tf' with the service 'provider', 'zone' and 'region'.
* Create Terraform Project and do 'terraform init'.
* Set terraform project in 'terra-exec.py' as per Terraform(working_dir='<Dir_Path>').
* Install XAMPP to run GUI locally.
* Run Apache from XAMPP-Control.
* Move 'Gui' folder under /xampp/htdocs/
* Open http://localhost/<name-of-the-folder>



## Architecture 

![Brahma Deploy Architecture](https://github.com/ashishsecdev/Brahma-Deploy/blob/main/Brahma-Deploy_logo.png)

# Project Contribution

- Please create a new branch and raise PR.

#Project By:
Ashishsecdev 

ashishsecdev@gmail.com
