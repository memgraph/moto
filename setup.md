# Setup Moto with local ec2 service

1) Create new virtual environment and activate it

2) Install moto development dependencies
   `pip install -r requirements-dev.txt`

3) Install Virtualbox and make sure it works

4) Goto `vms` directory and run `init_base.sh`

5) Start base image and make sure you can ssh into that instance
   Use `get_ip.sh` and then `ssh ec2-user@<ip>`
   Password is `password`
