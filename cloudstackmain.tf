terraform {
  required_providers {
    cloudstack = {
      source = "localdomain/provider/cloudstack"
      version = "0.3.0"
    }
  }
}

provider "cloudstack" {
  api_url    = "http://10.207.253.10:8080/client/api"
  api_key    = "m9Sp_8ZQW2OvL3dEH-2uzE6YMqveh_tghys3kdBFEvYwWNtD9jgwkXM4gkuQiQJYSa4TAOmIXAb8yXQAHcYYMw"
  secret_key = "eQYXq5vzwoEoi_iSv9KYScnanEZA16neF7RmhOfSpHIQT1HZlRbIDmcpueZyCWF-P2g665HclYBGi82SrIx1uQ"
}


resource "cloudstack_vpc" "default" {
    name = "test-vpc"
    display_text = "test-vpc"
    cidr = "10.0.0.0/16"
    vpc_offering = "Default VPC Offering"
    zone = "ZONE1"
}

resource "cloudstack_network_acl" "default" {
    name = "test-acl"
    vpc_id = "${cloudstack_vpc.default.id}"
}

resource "cloudstack_network" "subnet-1" {
    name = "subnet-1"
    display_text = "subnet-1"
    cidr = "10.0.10.0/24"
    network_offering = "DefaultIsolatedNetworkOfferingForVpcNetworks"
    #aclid = "${cloudstack_network_acl.default.id}"
    zone = "ZONE1"
    vpc_id = "${cloudstack_vpc.default.id}"
}


resource "cloudstack_instance" "vm01" {
  zone = "ZONE1"
  service_offering = "63b906fa-6ae3-40dd-9af9-ec6ae09910d2"
  template = "83f134e1-9d1e-11eb-a8e7-1e00f200001d"
  name = "vm01-subnet-1"
  network_id = "${cloudstack_network.subnet-1.id}"
}
