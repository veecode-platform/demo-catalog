variable "component_name" {
  description = "The name of the tenant component"
  type        = string
  default     = "${{values.componentName}}"
}

variable "kong_admin_url" {
  description = "Kong Admin API endpoint"
  type        = string
  default     = "${{values.kongAdminUrl}}"
}

variable "kong_admin_token" {
  description = "Kong Admin API token"
  type        = string
  default     = "${{values.kongAdminToken}}"
}

provider "kong" {
<<<<<<< Updated upstream
  admin_url       = var.kong_admin_url
  admin_token     = var.kong_admin_token
  tls_skip_verify = true
=======
  server_url       = var.kong_admin_url
  admin_token      = var.kong_admin_token
  tls_skip_verify  = true
>>>>>>> Stashed changes
}

resource "kong_service" "tenant_service" {
  name = var.instance_name
  url  = "http://${aws_instance.mycp.private_ip}"
}

resource "kong_route" "tenant_route" {
  service_id = kong_service.tenant_service.id
  hosts      = ["${var.component_name}.apps.vee.codes"]
  protocols  = ["http", "https"]
}
