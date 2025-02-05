resource "aws_key_pair" "key_db" {
  key_name   = "key_db"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIElqTNWxY5Bk2YSLIVR7s7g0snz3nh2c/lWeIMIxhgv8 dominik@DESKTOP-JEFL5HG"
}

resource "aws_key_pair" "key_web" {
  key_name   = "key_web"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWrk2E0pN15HzKGtY8q3orMsRbuXEomJ6/5pXTJlTgL dominik@DESKTOP-JEFL5HG"
}