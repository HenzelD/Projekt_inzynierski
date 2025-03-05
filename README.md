# Description
The project focuses on automating the configuration of an IT environment for web applications using two approaches: a local setup with Vagrant and a cloud-based deployment on AWS using Terraform. The implementation includes preparing the infrastructure for the Moodle system, automatically creating database and application instances, and configuring a load balancer to distribute traffic.

## Requirements:
- Locally: Vagrant, VirtualBox
- Cloud-based: AWS account, Terraform

## Installation:
```bash
git clone https://github.com/HenzelD/Projekt_inzynierski.git
cd Projekt_inzynierski
```
For cloud-based configurations, additionally run:
```bash
aws configure
```
## Choose a deployment method:

### Locally:
Edit the variable file according to your needs - variables.rb
#### Usage
Run the following command in the terminal:
```bash
vagrant up
```
Enter the configured IP address in the browser, which was set in the variable file.
#### Description
The script sets up the infrastructure for the Moodle system, automatically creating two virtual machines — one dedicated to the database and the other to the Moodle application. Both machines are fully configured automatically.
### Cloud-based:
Edit the variable file according to your needs - vars.tf
#### Usage
Run the following command in the terminal:
```bash
terraform init
terraform apply 
```
Enter the configured IP address in the browser, which was set in the vars.tf file.
#### Description
The script sets up the infrastructure for the Moodle system, automatically creating two instances — one dedicated to the database and the other to the Moodle application. Both instances are fully configured automatically.
### Advanced cloud-based:
Edit the variable file according to your needs - vars.tf
#### Usage
Run the following command in the terminal:
```bash
terraform init
terraform apply 
```
Enter the configured IP address in the browser, which was set in the vars.tf file. Then, complete the Moodle installation process, create your course, copy the files from the part 2 folder, and paste them into the part 1 folder. Run the commands again:
```bash
terraform init
terraform apply 
```
#### Description
The script sets up the infrastructure for the Moodle system, automatically creating two instances — one dedicated to the database and the other to the Moodle application. Both instances are fully configured automatically.
Part 2 in the advanced cloud-based setup is used to create an image from the configured machine, which is then used to launch additional instances. The traffic is distributed among them using a load balancer.





