# vCloud Director Connection Variables
variable "vcd_user" {
    description = "vCloud user"
}

variable "vcd_pass" {
    description = "vCloud pass"
}

variable "vcd_url" {
    description = "vCloud url"
}

variable "vcd_max_retry_timeout" {
    description = "vCloud max retry timeout"
}

variable "vcd_allow_unverified_ssl" {
    description = "vCloud allow unverified ssl"
}

# vCloud Director Organization Variables
variable "org_name" {
    description = "Organization Name"
}

variable "org_full_name" {
    description = "Organization Full Name"
}

variable "org_description" {
    description = "Organization Description"
}

# vCloud Director Organization VDC Variables
variable "vdc_alloc_model" {
  description = "VDC Allocation Model"
}
variable "vdc_net_pool" {
  description = "VDC Network Pool"
}
variable "vdc_pvdc_name" {
  description = "VDC Provider VDC Name"
}
variable "vdc_description" {
  description = "VDC Description"
}
variable "vdc_name" {
  description = "VDC Name"
}
variable "allocate_cpu" {
  description = "allocate cpu quota to organization"
}
variable "allocate_memory" {
  description = "allocate memory to organization"
}
variable "vdc_storage_name" {
  description = "VDC Storage Policy"
}
variable "vdc_storage_limit" {
  description = "VDC Storage Limit"
}
variable "network_quota" {
  description = "enter the amount of allocated netwolrk bandwidth"
 }
variable "maximum_runtime_lease" {
  description = "enter the amount of time in secs for lease. enter '0' for never expires"
}
variable "maximum_storage_lease" {
  description = "enter the amount of time in secs for lease. enter '0' for never expires"
}

#Edge gateway
variable "edge_name" {
    description = "enter name of edge gateway"
}
variable "configuration" {
  description = "enter the type of edge deployment,e.g compact"
}
variable "external_network" {
  description = "enter name of vcd external network"
}
variable "ip_address" {
  description = "allocate ip address to edge device"
}
variable "gateway" {
  description = "enter the gateway for edge device"
}
variable "netmask" {
  description = "enter the netmask for the edge device"
}
variable "suballocated_pool_start_ip" {
  description = "enter the start ip for the suballocated pool based on the external network"
}
variable "suballocated_pool_end_ip" {
  description = "enter the end ip for suballocated pool based on the external network"
}

#Create routed network
variable "routed_network_name" {
  description = "enter the name for the routed network"
}
variable "routed_gateway" {
  description = "enter the gateway IP for the routed network"
}
variable "start_ip" {
    description = "start ip set"
 }
 variable "end_ip" {
    description = "start ip set"
 }

#DNAT
variable "DNATnetwork_type" {
  description = "the type of network used. eg routed network"
}
variable "original_address" {
  description = "enter the ip that you inted to NAT, the ip must be within the range of the created subnet"
}
variable "translated_address" {
  description = "enter the ip that the original ip would be translated into. the ip must be in the range of the suballocated ip set"
}

#SNAT
variable "SNATnetwork_type" {
  description = "the type of network used. eg routed network"
}
variable "SNAToriginal_address" {
  description = "enter the ip that the original ip would be translated into. the ip must be in the range of the suballocated ip set"
}
variable "SNATtranslated_address" {
  description = "enter the ip that you inted to NAT, the ip must be within the range of the created subnet"
}

#ORG USER
variable "org_user_name" {
  description = "enter a new organization admin username"
}
variable "org_user_role" {
  description = "enter a role for the new user e.g admin, catalogue author"
}
variable "org_user_password" {
  description = "enter a unique password for the user"
}

#CREATE VM
variable "vm_name" {
  description = "enter name for VM"
}
variable "catalog_name" {
  description = "enter the catalog where VM template is stored"
}
variable "template_name" {
  description = "enter the template that should be used"
}
variable "enter_number_of_cpus" {
  description = "enter the number of cpus for the VM"
}
variable "enter_memory" {
  description = "enter the memory you intend to allocate to Vm"
}
#network
variable "VMnetwork_type" {
  description = "enter the type of network used in the org."
}
variable "ip_allocation_mode" {
  description = "the mode of ip allocation to VM. eg DHCP, Static pool"
}
