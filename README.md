
# Assignment 2 – Cloud Computing

## Description
This project deploys a secure AWS infrastructure using Terraform.

## Components
- VPC and Subnet
- Security Groups
- Backend Apache Servers
- Nginx Load Balancer with SSL
- Modular Terraform structure

## Technologies
- AWS
- Terraform
- Nginx
- Apache

## How to Deploy
```bash
terraform init
terraform apply



\# Assignment 2 – Multi-Tier Web Infrastructure (AWS + Terraform)



\## Project Overview

This project deploys a multi-tier web infrastructure on AWS using Terraform.

It includes an Nginx reverse proxy/load balancer and three backend Apache web servers.

The architecture demonstrates load balancing, caching, HTTPS, and high availability.



\## Architecture Overview

┌───────────────────────────────────────────┐

│ Internet                                 │

└─────────────────────┬─────────────────────┘

&nbsp;                     │ HTTPS (443)

&nbsp;                     ▼

&nbsp;             ┌───────────────────┐

&nbsp;             │ Nginx Server       │

&nbsp;             │ (Load Balancer)    │

&nbsp;             │ - SSL/TLS          │

&nbsp;             │ - Reverse Proxy    │

&nbsp;             │ - Caching          │

&nbsp;             └─────────┬─────────┘

&nbsp;       ┌───────────────┼───────────────┐

&nbsp;       │               │               │

&nbsp;       ▼               ▼               ▼

&nbsp;  ┌────────┐     ┌────────┐     ┌────────┐

&nbsp;  │ Web-1  │     │ Web-2  │     │ Web-3  │

&nbsp;  │ Apache │     │ Apache │     │ Apache │

&nbsp;  │Primary │     │Primary │     │ Backup │

&nbsp;  └────────┘     └────────┘     └────────┘





\## Components Description



\- \*\*VPC\*\* – Custom AWS Virtual Private Cloud

\- \*\*Subnet\*\* – Public subnet for all EC2 instances

\- \*\*Security Groups\*\*

&nbsp; - Nginx SG: allows 22, 80, 443

&nbsp; - Backend SG: allows 80 from Nginx only

\- \*\*Nginx Server\*\*

&nbsp; - Acts as reverse proxy and load balancer

&nbsp; - Uses HTTPS with self-signed certificate

&nbsp; - Implements caching

\- \*\*Backend Servers\*\*

&nbsp; - Apache HTTP servers

&nbsp; - web-1 and web-2 are primary

&nbsp; - web-3 is configured as backup



---



\## Prerequisites



\- AWS Account

\- Terraform installed

\- AWS CLI installed

\- Git Bash / Terminal

\- SSH client



---



\## Required Tools



\- Terraform

\- AWS CLI

\- OpenSSH

\- Git Bash

\- Web Browser



---



\## AWS Credentials Setup



```bash

aws configure



