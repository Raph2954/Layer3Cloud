# Connect VMware vCloud Director Provider
terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.7.0"
    }
  }
}
#Connection
provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_pass
  auth_type            = "integrated"
  org                  = "System"
  url                  = var.vcd_url
  max_retry_timeout    = var.vcd_max_retry_timeout
  allow_unverified_ssl = var.vcd_allow_unverified_ssl
}

# Create new vCloud Org
resource "vcd_org" "org-name" {
  name                = var.org_name
  full_name           = var.org_full_name
  description         = var.org_description
  is_enabled          = "true"
  delete_recursive    = "true"
  delete_force        = "true"
  can_publish_catalogs = "false"

 vapp_lease {
    maximum_runtime_lease_in_sec          = var.maximum_runtime_lease
    power_off_on_runtime_lease_expiration = true
    maximum_storage_lease_in_sec          = var.maximum_storage_lease
    delete_on_storage_lease_expiration    = false
  }
}

# Create new VDC
resource "vcd_org_vdc" "vdc-name" {
  name        = var.vdc_name
  description = var.vdc_description
  org         = var.org_name

  allocation_model = var.vdc_alloc_model
  network_pool_name = var.vdc_net_pool
  provider_vdc_name = var.vdc_pvdc_name

  compute_capacity {
    cpu {
      allocated = var.allocate_cpu
    }
    memory {
      allocated = var.allocate_memory
    }
  }

  storage_profile {
    name = var.vdc_storage_name
    limit = var.vdc_storage_limit
    default = true
  }

  cpu_guaranteed = 20
  memory_guaranteed = 20
  cpu_speed = 2000
  network_quota = var.network_quota
  enabled = true
  enable_thin_provisioning = true
  enable_fast_provisioning = false
  delete_force = true
  delete_recursive = true 

  depends_on = [vcd_org.org-name]
}


#craete an edge gateway
resource "vcd_edgegateway" "egw" {
  org = var.org_name
  vdc = var.vdc_name

  name          = var.edge_name
  configuration = var.configuration

  external_network {
    name = vcd_org_vdc.vdc-name.network_pool_name

    subnet {
      ip_address = var.ip_address
      gateway    = var.gateway
      netmask    = var.netmask

      suballocate_pool {
        start_address = var.suballocated_pool_start_ip
        end_address   = var.suballocated_pool_end_ip
      }

    }
  }
}

#create routed network
resource "vcd_network_routed" "net" {
  org = var.org_name
  vdc = var.vdc_name

  name         = var.routed_network_name
  edge_gateway = vcd_edgegateway.egw.name
  gateway      = var.routed_gateway

  static_ip_pool {
    start_address = var.start_ip
    end_address   = var.end_ip
  }
}


#DNAT
resource "vcd_nsxv_dnat" "web" {
  org = var.org_name
  vdc = var.vdc_name

  edge_gateway = vcd_edgegateway.egw.name
  network_type = var.DNATnetwork_type
  network_name = vcd_network_routed.net.name

  original_address   = var.original_address
  translated_address = var.translated_address
}

#SNAT
resource "vcd_nsxv_snat" "web" {
  org = var.org_name
  vdc = var.vdc_name

  edge_gateway = vcd_edgegateway.egw.name
  network_type = var.SNATnetwork_type
  network_name = vcd_network_routed.net.name

  original_address   = var.SNAToriginal_address
  translated_address = var.SNATtranslated_address
}


#ORG USER
resource "vcd_org_user" "my-org-admin" {
  org = var.org_name

  name        = var.org_user_name
  role        = var.org_user_role
  password    = var.org_user_password
}


#CREATE VM
resource "vcd_vm" "vm01" {
  org = var.org_name
  name = var.vm_name

  catalog_name  = var.catalog_name
  template_name = var.template_name
  cpus          = var.enter_number_of_cpus
  memory        = var.enter_memory

  network {
    name               = vcd_network_routed.net.name
    type               = var.VMnetwork_type
    ip_allocation_mode = var.ip_allocation_mode
  }
}
