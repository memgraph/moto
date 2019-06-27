# Setup Moto with local ec2 service

1) Create new virtual environment and activate it

2) Install moto development dependencies
   `pip install -r requirements-dev.txt`

3) Install Virtualbox and make sure it works

4) Go to `vm_scripts` directory and run `init_base.sh`

5) Create new instance with `create_instance.sh <name>`
   Start instance with `start_instance.sh <name>`
   Get instance ip with `get_ip.sh <name>`
   Connect with `ssh ec2-user@<ip>` (password is `password`)
   Stop instance with `stop_instance.sh <name>`
   Delete instance with `delete_instance.sh <name>`
