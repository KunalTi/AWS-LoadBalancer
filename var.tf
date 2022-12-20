variable "lbname" {
  type = string
}

variable "internal" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "security_groups" {
  type = set(string)
}

variable "subnet" {
  type = string
}

variable "enable_deletion_protection" {
  type = bool
}

variable "enable_cross_zone_load_balancing" {
  type = bool
}

variable "enable_http2" {
  type = bool
}

variable "enable_waf_fail_open" {
  type = bool
}

variable "ip_address_type" {
  type = string
}

variable "desync_mitigation_mode" {
  type = string
}

variable "bucket" {
  type = string
}

variable "prefix" {
  type = string
}

variable "enable_bucket" {
  type = string
}

variable "allocation_id" {
  type = string
}

variable "private_ip" {
  type = string
}

variable "subnets" {
  type = set(string)
}

variable "load_balancer_arn" {
  type = string
}

variable "port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "ssl_policy" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "type" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "target_name" {
  type = string
}

variable "target_port" {
  type = number
}

variable "target_protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "target_id" {
  type = string
}

variable "connection_termination" {
  type = bool
}

variable "deregistration_delay" {
  type = string
}

variable "lambda_multi_value_headers_enabled" {
  type = bool
}

variable "proxy_protocol_v2" {
  type = bool
}

variable "slow_start" {
  type = number
}

variable "target_type" {
  type = string
}


# variable "notifications" {
#   type = tuple([string, string])
# }

# variable "lbname" {
#   type = string
# }

# variable "port" {
#   type = string
# }

# variable "protocol" {
#   type = string
# }

# variable "group_names" {
#   type = tuple([string, string])
# }

# variable "metric_aggregation_type" {
#   type = string
# }
