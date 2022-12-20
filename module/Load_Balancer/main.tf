# Application Load Balancer

resource "aws_lb" "test" {
  name                             = var.lbname
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2
  enable_waf_fail_open             = var.enable_waf_fail_open
  ip_address_type                  = var.ip_address_type
  desync_mitigation_mode           = var.desync_mitigation_mode
  tags                             = var.tags
  access_logs {
    bucket  = var.bucket
    prefix  = var.prefix
    enabled = var.enable_bucket
  }
  # Specifying Elastic IPs and private IP addresses for an internal-facing load balancer
  subnet_mapping {
    subnet_id            = var.subnet
    allocation_id        = var.allocation_id
    private_ipv4_address = var.private_ip
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn
  tags              = var.tags

  default_action {
    type             = var.type
    target_group_arn = var.target_group_arn
  }

  #   type = "redirect"
  #     redirect {
  #       port        = "443"
  #       protocol    = "HTTPS"
  #       status_code = "HTTP_301"
  #     }

  #   type = "fixed-response"
  #     fixed_response {
  #       content_type = "text/plain"
  #       message_body = "Fixed response content"
  #       status_code  = "200"
  #     }

  #   type = "authenticate-cognito"
  #     authenticate_cognito {
  #       user_pool_arn       = aws_cognito_user_pool.pool.arn
  #       user_pool_client_id = aws_cognito_user_pool_client.client.id
  #       user_pool_domain    = aws_cognito_user_pool_domain.domain.domain
  #     }

  #    type = "authenticate-oidc"
  #     authenticate_oidc {
  #       authorization_endpoint = "https://example.com/authorization_endpoint"
  #       client_id              = "client_id"
  #       client_secret          = "client_secret"
  #       issuer                 = "https://example.com"
  #       token_endpoint         = "https://example.com/token_endpoint"
  #       user_info_endpoint     = "https://example.com/user_info_endpoint"
  #     }

  depends_on = [
    aws_lb_target_group.test
  ]
}

# Instance Target Group
resource "aws_lb_target_group" "test" {
  name                               = var.target_name
  port                               = var.target_port
  protocol                           = var.target_protocol
  vpc_id                             = var.vpc_id
  connection_termination             = var.connection_termination
  deregistration_delay               = var.deregistration_delay
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = var.proxy_protocol_v2
  slow_start                         = var.slow_start
  target_type                        = var.target_type
  tags                               = var.tags
}

# IP Target Group
# resource "aws_lb_target_group" "ip-example" {
#   name        = "tf-example-lb-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = aws_vpc.main.id
# }

# Lambda Target Group
# resource "aws_lb_target_group" "lambda-example" {
#   name        = "tf-example-lb-tg"
#   target_type = "lambda"
# }

# ALB Target Group
# resource "aws_lb_target_group" "alb-example" {
#   name        = "tf-example-lb-alb-tg"
#   target_type = "alb"
#   port        = 80
#   protocol    = "TCP"
#   vpc_id      = aws_vpc.main.id
# }

resource "aws_lb_listener_certificate" "example" {
  listener_arn    = aws_lb_listener.front_end.arn
  certificate_arn = var.certificate_arn
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = var.target_id
}
