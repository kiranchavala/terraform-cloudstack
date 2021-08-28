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


resource "cloudstack_instance" "terraforminstance" {

  service_offering="63b906fa-6ae3-40dd-9af9-ec6ae09910d2"

  template="83f134e1-9d1e-11eb-a8e7-1e00f200001d"

  zone="8b340ea8-eb7b-4b56-9629-319f152d7ecb"

  network_id="83c5216a-cacf-4025-af6f-b27818ba2404"

  display_name="teraform"

}
