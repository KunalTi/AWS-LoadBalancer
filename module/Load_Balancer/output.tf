output "lbARN" {
  value = aws_lb.test.arn
}

output "arn_suffix" {
  value = aws_lb.test.arn_suffix
}

output "dns_name" {
  value = aws_lb.test.dns_name
}

output "id" {
  value = aws_lb.test.id
}

output "vpc_id" {
  value = aws_lb.test.vpc_id
}

output "zone_id" {
  value = aws_lb.test.zone_id
}

output "listner_arn" {
  value = aws_lb_listener.front_end.arn
}

output "listner_id" {
  value = aws_lb_listener.front_end.id
}

output "target_group_arn" {
  value = aws_lb_target_group.test.arn
}

output "target_group_id" {
  value = aws_lb_target_group.test.id
}

output "certificate_id" {
  value = aws_lb_listener_certificate.example.id
}
