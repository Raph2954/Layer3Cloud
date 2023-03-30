# connect to vmware vsphere vcenter
provider "vsphere" {
    version = "1.15.0"
    vim_keep_alive = 30
    user = var.vsphere-user
    password = var.vsphere-password
    vsphere_server = var.vsphere-vcenter

    allow_unverified_ssl = var.vsphere-unverified-ssl
}

#Define vmware vsphere
data "vsphere_datacenter" "dc" {
    name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore" {
    name = var.vm-datastore
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
    name = var.vsphere-cluster
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
    name = var.vm-network
    datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "Ubuntutemplate01" {
    name = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
    datacenter_id = data.vsphere_datacenter.dc.id
}

#create VMs
resource "vsphere_virtual_machine" "vm" {
    count = var.vm-count

    name = "${var.vm-name}-${count.index + 1}"
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.datastore.id

    num_cpus = var.vm-cpu
    memory = var.vm-ram
    guest_id = var.vm-guest-id

    network_interface {
        network_id = data.vsphere_network.network.id
    }
  
    disk {
    label = "${var.vm-name}-${count.index + 1}-disk"
    thin_provisioned = true
    eagerly_scrub = false
    size = 25
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.Ubuntutemplate01.id
        customize {
            linux_options {
                host_name = "${var.vm-name}-${count.index + 1}"
                domain = var.vm-domain
            }
            network_interface {}
            timeout = 30
        }
    }
}

