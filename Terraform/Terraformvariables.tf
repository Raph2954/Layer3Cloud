
variable "vsphere-user" {
    type = string
    description = "username"
  
}

variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
}

variable "vsphere-password" {
    type = string
    description = "vsphere password"
}

variable "vsphere-vcenter" {
    type = string
    description = "vcenter ip address"
}

variable "vsphere-datacenter" {
    type = string
    description = "vmware vsphere data center"
}

variable "vsphere-cluster" {
    type = string
    description = "vmware assignmenet cluster name"
}

variable "vsphere-template-folder" {
    type = string
    description = "vsphere template folder name"
    default = "Template"
}

#virtual machine
variable "vm-count" {
    type = string
    description = "number of VMs"
}

variable "vm-name-prefix" {
    type = string
    description = "prefix before standard name"
    default = "L3"
}

variable "vm-datastore" {
    type = string
    description = "allocated datastore name"
}

variable "vm-network" {
    type = string
    description = "network used for the vsphere virtual machine"
}

variable "vm-cpu" {
    type = string
    description = "number of cpu's"
    default = "1"
}

variable "vm-ram" {
    type = string
    description = "vm ram size"
    default = "2000"
}

variable "vm-name" {
    type = string
    default = "vm-01"
}

variable "vm-guest-id" {
    type = string
    description = "ID of the guest operating system"
}

variable "vm-template-name" {
  type = string
  default = "Template"
}

variable "vm-domain" {
    type = string
    description = "vm domain name for the machine"
  
}