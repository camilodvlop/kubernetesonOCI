# kubernetesonOCI
kubernetes cluster with docker images deployed on OCI Oracle Cloud Infrastructure  
In OCI console:
create a user in OCI
creaate a group  terraform-group
creation of policies :
Allow group terraform-group to manage cluster-family in tenancy	Row with I.D. Allow group terraform-group to manage cluster-family in tenancy
Allow group terraform-group to manage instance-family in tenancy	Row with I.D. Allow group terraform-group to manage instance-family in tenancy
Allow group terraform-group to manage virtual-network-family in tenancy	Row with I.D. Allow group terraform-group to manage virtual-network-family in tenancy
Allow group terraform-group to inspect compartments in tenancy

to obtain the images use this command in oci cloud shell: 
oci ce node-pool-options get --node-pool-option-id all

