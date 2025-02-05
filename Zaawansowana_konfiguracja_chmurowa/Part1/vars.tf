variable "region" {
  default = "eu-west-2"
}

variable "zone1" {
  default = "eu-west-2a"
}

variable "webuser" {
  default = "ubuntu"
}

variable "dbuser" {
  default = "ubuntu"
}

variable "amiID" {
  default = "ami-03ceeb33c1e4abcd1"
}

variable "path" {
  default = "/moodle"
}

variable "how_many_instances" {
  default = 2
}

variable "your_ip" {
  default = "0.0.0.0/0"
}

variable "db_instance_type" {
  default = "t2.micro"
}

variable "db_user" {
  default = "moodleuser"
}

variable "db_pass" {
  default = "yourpassword"
}

variable "web_instance_type" {
  default = "t2.micro"
}