variable "region" {
  type    = string
  default = "eu-central-1"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }


# source block for searching for an appropriate base image
source "amazon-ebs" "base_image" {
  ami_name      = "jumia-phone-validator-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    Name = "Jumia Phone Validator Base"
  }
}

# The building block that uses the provisioners specified
build {
  sources = ["source.amazon-ebs.base_image"]

  provisioner "file" {
    source      = "../ssh-keys/jumia-phone-validator.pub"
    destination = "/tmp/jumia-phone-validator.pub"
  }
  provisioner "shell" {
    script = "../scripts/base_image.sh"
  }
}