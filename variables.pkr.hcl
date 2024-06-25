variable "memory" {
  type    = string
  default = "1024"
}

variable "cpus" {
  type    = string
  default = "1"
}

variable "disk_size" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "iso_checksum_type" {
  type    = string
  default = ""
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "output_directory" {
  type    = string
  default = ""
}

// variable "output_vagrant" {
//   type    = string
//   default = ""
// }

variable "secondary_iso_image" {
  type    = string
  default = ""
}

variable "switch_name" {
  type    = string
  default = ""
}

variable "sysprep_unattended" {
  type    = string
  default = ""
}


// variable "vagrantfile_template" {
//   type    = string
//   default = ""
// }

variable "upgrade_timeout" {
  type    = string
  default = ""
}

// variable "vagrant_sysprep_unattended" {
//   type    = string
//   default = ""
// }

variable "vlan_id" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}
