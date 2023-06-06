resource "aws_lb" "external-elb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups_id]
  subnets            = [var.public_subnet1, var.public_subnet2]
}

resource "aws_lb_target_group" "external-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_ID
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = var.public-EC2-Instances1
  port             = 80
}

#depends_on = [
    # aws_instance.webserver1,
# var.public-EC2-Instance1,
#]
#x

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = var.public-EC2-Instances2
  port             = 80

  #depends_on = [
 # aws_instance.webserver2,
# var.public-EC2-Instance2,
# ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}





