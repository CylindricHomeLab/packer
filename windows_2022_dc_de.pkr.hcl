source "hyperv-iso" "vm" {
  boot_command          = ["a<enter><wait>a<enter><wait>a<enter><wait>a<enter>"]
  boot_wait             = "1s"
  communicator          = "winrm"
  cpus                  = "${var.cpus}"
  disk_size             = "${var.disk_size}"
  enable_dynamic_memory = "true"
  enable_secure_boot    = false
  generation            = 2
  guest_additions_mode  = "disable"
  iso_checksum          = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_url               = "${var.iso_url}"
  memory                = "${var.memory}"
  output_directory      = "${var.output_directory}"
  secondary_iso_images  = ["${var.secondary_iso_image}"]
  shutdown_timeout      = "30m"
  skip_export           = true
  skip_compaction       = true
  switch_name           = "${var.switch_name}"
  temp_path             = "F:\\Virtual Machines\\packer"
  vlan_id               = "${var.vlan_id}"
  vm_name               = "${var.vm_name}"
  winrm_username        = "Administrator"
  winrm_password        = "password"
  winrm_timeout         = "8h"
  keep_registered       = false
  shutdown_command      = "C:\\Windows\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /shutdown /unattend:C:\\Windows\\system32\\sysprep\\unattend.xml"
}

build {
  sources = ["source.hyperv-iso.vm"]

  // provisioner "powershell" {
  //   elevated_password = "password"
  //   elevated_user     = "Administrator"
  //   script            = "./files/zero_disks.ps1"
  // }

  provisioner "file" {
    destination = "C:\\Windows\\System32\\Sysprep\\unattend.xml"
    source      = "${var.sysprep_unattended}"
  }

  provisioner "powershell" {
    inline = [
      "Set-ItemProperty -Path 'HKLM:\\SYSTEM\\Setup\\Status\\SysprepStatus' -Name 'GeneralizationState' -Value 7 -Verbose -Force",
      "Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\WindowsNT\\CurrentVersion\\SoftwhereProtectionPlatform' -Name 'SkipRearm' -Value 1 -Verbose -Force"
    ]
    // "& C:\\Windows\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /shutdown /unattend:C:\\Windows\\system32\\sysprep\\unattend.xml"
  }

}
