#Linux VM variables

variable "web_linuxvm_instance_count" {
  description = "Web Linux VM Instance Count"
  type        = map(string)
  default = {
    "vm1" = "1022"
    "vm2" = "2022"
    "vm3" = "3022"
  }
}

# Implementation using count meta arguments.
/*
# Web Linux VM Instance Count
variable "web_linuxvm_instance_count" {
  description = "Web Linux VM Instance Count"
  type = number 
  default = 1
}

# Web LB Inbout NAT Port for All VMs
variable "lb_inbound_nat_ports" {
  description = "Web LB Inbound NAT Ports List"
  type = list(string)
  default = ["1022", "2022", "3022", "4022", "5022"]
}
*/
