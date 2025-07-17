terraform {
  # Using remote backend for Terraform Cloud
  cloud {
    # Organization, project and workspace created by "veecode-saas-bootstrap" automation
    organization = "veecode"    
    workspaces {
      project = "veecode-saas"
      name = "veecode-cp-${{values.componentName}}-tenant"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.99.1"
    }
    kong = {
      source  = "kong/kong-gateway"
      version = ">= 0.5.2"
    }
  }
}