data "template_file" "cloudinit" {
  template =  "${file("${path.module}/cloud-init-linux-cmc.tpl")}"
  vars = {
    host_name = var.host_name
  }
}


resource "local_file" "cloudinit" {
  content  = data.template_file.cloudinit.rendered
  filename = "cloud-init-linux-cmc.config"
 }

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudinit.rendered
  }
}

output "cloudinit" {
  value = data.template_file.cloudinit.rendered
}


