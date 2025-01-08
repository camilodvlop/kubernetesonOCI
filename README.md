# kubernetesonOCI
kubernetes cluster with docker images deployed on OCI Oracle Cloud Infrastructure  
creation of user in OCI
crfeation of group  ansible-group
creation of policies :
Allow group ansible-group to manage cluster-family in tenancy	Row with I.D. Allow group ansible-group to manage cluster-family in tenancy
Allow group ansible-group to manage instance-family in tenancy	Row with I.D. Allow group ansible-group to manage instance-family in tenancy
Allow group ansible-group to manage virtual-network-family in tenancy	Row with I.D. Allow group ansible-group to manage virtual-network-family in tenancy
Allow group ansible-group to inspect compartments in tenancy

descargar archivo de api key
en WSL terminal execute: 
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"

to install pip you need a virtual env for python:
sudo apt install python3-venv
create the virtual env called  oci_env
python3 -m venv oci_env
activate the virtual env: 
source oci_env/bin/activate
install pip packages
pip install oci-cli[ansible]
ckeck if oci was installed : oci --version

