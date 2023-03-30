# vCloud Director Connection Variables

vcd_user = "raphael.daniel"
vcd_pass = "Layer3@123"
vcd_url = "https://lag.layer3.cloud/login/login.jsp?service=provider&redirectTo=%2Fprovider"
vcd_max_retry_timeout = "60"
vcd_allow_unverified_ssl = "true"

# vCloud Director Organization Variables
org_name = "NSPM"
org_full_name = "Nigeria Security Minting and Printing"
org_description = ""
maximum_runtime_lease = "0"
maximum_storage_lease = "0"

# Create new VDC
vdc_alloc_model = "Flex" # Flex
vdc_net_pool = "Layer3-lag_Provider_VDC-VXLAN-NP"
vdc_pvdc_name = "Layer3-lag_Provider_VDC"
vdc_name = "NSPM"
vdc_description = "NSPM Secondary VDC"
allocate_cpu = "8"
allocate_memory = "10"
vdc_storage_name = "L3Cloud-Base"
vdc_storage_limit = "3000"
network_quota = "5"

#Create edge gateway
edge_name = "NSPM edge gateway"
configuration = "compact"
external_network = "NSPM external network"
#subnet
ip_address = "102.164.38.80"
gateway = "102.164.38.1"
netmask = "255.255.255.0"
#suballocation pool
suballocated_pool_start_ip = "102.164.38.80"
suballocated_pool_end_ip = "102.164.38.81"

#Create routed network
routed_network_name = "NSPM static network"
routed_gateway = "10.10.10.1"
start_ip = "10.10.10.2"
end_ip = "10.10.10.4"

#DNAT
DNATnetwork_type = "routed network"
original_address = "10.10.10.2, 10.10.10.3"
translated_address = "102.164.38.80, 102.164.38.81"

#SNAT
SNATnetwork_type = "routed network"
SNAToriginal_address = "102.164.38.80, 102.164.38.81"
SNATtranslated_address = "10.10.10.2, 10.10.10.3"

#Org User
org_user_name = "Administrator"
org_user_role = "administrator"
org_user_password = "Admin@123"

#Create Vm
vm_name = "VM01"
catalog_name = "Layer3_Public_Catalog"
template_name = "CentOS7"
enter_number_of_cpus = "2"
enter_memory = "4"
VMnetwork_type = "static"
ip_allocation_mode = "Static-IP Pool"