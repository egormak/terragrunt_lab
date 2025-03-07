# Создание группы безопасности для разрешения входящего трафика
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Разрешает подключение через SSH с любого IP-адреса
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Разрешает доступ к HTTP серверу с любого IP-адреса
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Все протоколы
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Создание экземпляра EC2 в рамках Free Tier
resource "aws_instance" "free_tier_ec2" {
  ami           = "ami-02ccbe126fe6afe82"  # AMI ID для Amazon Linux 2 (us-west-2)
  instance_type = "t2.micro"               # Тип экземпляра, соответствующий Free Tier
  
#   key_name      = aws_key_pair.my_key.key_name  # Используем ранее созданную ключевую пару
  security_groups = [aws_security_group.allow_ssh_http.name]  # Применяем группу безопасности

  tags = {
    Name = "FreeTierEC2Instance"
  }
}