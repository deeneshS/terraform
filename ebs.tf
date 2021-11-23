resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}

resource "aws_instance" "web" {
  ami           = "ami-04ad2567c9e3d7893"
  instance_type = "t2.micro"

  tags = {
    Name = "webtest"
    env  = "prod"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 1
}