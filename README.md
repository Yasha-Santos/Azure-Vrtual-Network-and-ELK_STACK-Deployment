## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](/Images/Azure-Cloud-Network-With-ELK_STACK.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml and config file may be used to install only certain pieces of it, such as Filebeat.

- [Ansible Playbook File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/my-playbook1.yml)
- [Ansible Hosts File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/hosts)
- [Ansible Configuration File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ansible.cfg)
- [Ansible ELK Installation and VM Configuration File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/install-elk.yml)
- [Ansible Filebeat Playbook File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/filebeat-playbook.yml)
- [Ansible Filebeat Config File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/Filebeat-config.yml)
- [Ansible Metricbeat Playbook File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/metricbeat-playbook.yml)
- [Ansible Metricbeat Config File](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/metricbeat-config.yml)

#### This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly protected by helping or defending the system from DDoS attacks by shifting attack traffic from the corporate server to a public cloud provider, in addition to restricting traffic to the network, a jump box is a secure computer that all admins first connect to before launching any administrative task or use as an origination point to connect to other servers or untrusted environments, meaning that you can only connect to your workspace by connecting to the jumbox first because its protected with firewals and etc,.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

**Filebeat** is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

**Metricbeat** is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1 / 104.42.213.223    | Linux    |
| Elk-1     |  Elk Server | 10.1.0.4 / 52.188.1.16   | Linux    |
| Web1    |      Web Server              | 10.0.0.10 | Linux    |
| Web2     |       Web Server            | 10.0.0.9  | Linux    |
|  Workstation  |      Access Control    | Public IP | Linux    |
|  Load Balancer  |  Load Balancer  |  Static Public IP | Linux |

- Follow this step below to create a Load Balancer for Web1 and Web2

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- Workstation Public IP On Port TCP 5601.

Machines within the network can only be accessed by SHH Login. The machine that I allowed the access to the Elk vm is Web1 vm because it has the ansile container and only from there I can access the elk server and also the reason is that the elk server is protected witha firewall that I only allowed the entry from Web1 vm, the ip adress is for Web1 is 10.0.0.10

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No              | Workstaion Public IP Using SSH port 22   |
|     Web1     |     No                |     10.0.0.5 (Jump-Box VM) SSH port 22        |
|  Web2        |      No               |    10.0.0.5 (Jump-Box VM) SSH port 22   |
| ELK Server |       No              | Workstation Public IP on TCP 5601    |
| Load Balancer |    No           | Workstation Public IP on HTTP 80 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows IT administrators to automate away the hard work from their daily tasks, meaning that it gives them more time to focus on efforts that help deliver more value to the business by spending time on more important tasks.


The playbook implements the following tasks:
- Specify a different group of machines as well as a different remote user

```name: Config elk VM with Docker
    hosts: elk
    remote_user: sysadmin
    become: true
    tasks:
```
- Increase System Memory :

 ```name: Use more memory
  sysctl:
    name: vm.max_map_count
    value: '262144'
    state: present
    reload: yes
```
- Install the following services:

```docker.io
python3-pip
docker, which is the Docker Python pip module.
```   
- Launching and Exposing the container with these published ports:
```
 5601:5601 
 9200:9200
 5044:5044
``` 
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance. 

![](/Images/Docker_ps_output.png)

**Dont Foget To Use sudo when using docker**

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- 10.0.0.10 (Web1)
- 10.0.0.9 (Web2)

We have installed the following Beats on these machines:

- ELK Server, Web1 and Web2

These Beats allow us to collect the following information from each machine:

- Filebeat: Log Events
  - ![](/Images/Filebeat.png)
  
- Metricbeat: Metrics and System Statistics
  - ![](/Images/Metricbeat.png)
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the [Ansible ELK Installation and VM Configuration](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/install-elk.yml) file to **/etc/ansible/files.
- Update the [Ansible Hosts](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/hosts) file to include Web1 and Web2 private addresses, and add pyhton by using the command `ansible_python_interpreter=/usr/bin/python3`
- Run the playbook, and navigate to **WorkstationIP":5601** (Kibana) to check that the installation worked as expected.

### Frequently asked questions

- _Which file is the playbook? 

- **Filebeat**
  - [Ansible Filebeat Playbook](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/filebeat-playbook.yml)

- **Metricbeat**
  - [Ansible Metricbeat Playbook](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/ELK_STACK/metricbeat-playbook.yml)

Where do you copy it to?

 `/etc/ansible/files`

- _Which file do you update to make Ansible run the playbook on a specific machine? 

[Ansible Hosts](https://github.com/Yasha-Santos/Azure-Vrtual-Network-and-ELK_STACK-Deployment/blob/main/Ansible/hosts)

How do I specify which machine to install the ELK server on versus which to install Filebeat on?

You navigate into `/etc/ansible` you edit the hosts file using the command `nano hosts` and then add your vms private ip under the `[Webservers]` row and adding `"Web1/Web2 private ip" ansible_python_interpreter=/usr/bin/python3` and then save it. `Exapmle: 10.0.0.10 ansible_python_interpreter=/usr/bin/python3`   

- Which URL do you navigate to in order to check that the ELK server is running?

http://(your Public IP):5601/app/kibana


# Small Guide into azure and ELK_STACK deployment into the VM's

**Generating a new SHH-Key**

`ssh-keygen`

**The output of this command should look like this:**

```Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Yaser/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/Yaser/.ssh/id_rsa
Your public key has been saved in /c/Users/Yaser/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:SzAoxEUM5CqMvK3K6vBhjpvnCZkaRB/P8DQwadFbGrs Yaser@DESKTOP-4QJJV0L
The key's randomart image is:
+---[RSA 3072]----+
| o+O*            |
| o.o++ .         |
| .+o.oO          |
|=...B+.o         |
|++ . +. S        |
|ooo  E . .       |
|*.o.    .        |
|+Ooo             |
|@B=              |
+----[SHA256]-----+
```
**IMPORTANT** This newly generated SSH key has to be added on every VM that youre going to use, Jump-Box, Web1, Etc.

### Install Docker if you dont have it already

`sudo apt-get install -y docker-ce`

**Start it and check it if its running** 

`sudo systemctl status docker`

**If its not started yet start it using the command:**
  
`sudo systemctl start docker`

**You should have something like this**

```
  docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2018-10-18 20:28:23 UTC; 35s ago
     Docs: https://docs.docker.com
 Main PID: 13412 (dockerd)
   CGroup: /system.slice/docker.service
           ├─13412 /usr/bin/dockerd -H fd://
           └─13421 docker-containerd --config /var/run/docker/containerd/containerd.toml
 ```
 
### Download the ELK container from the repository usiing the command:

`sudo docker pull cyberxsecurity/elk`


