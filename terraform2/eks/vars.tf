variable "eksclustername" {
  description = "Name of EKS cluster"
  type        = string
}

variable "subnet1id" {
  description = "Subnet 1 ID"
  type        = string
}

variable "subnet2id" {
  description = "Subnet 2 ID"
  type        = string
}

variable "eksclusterrolename" {
  description = "Name of cluster role"
  type        = string
}

variable "eksnodegroupname" {
  description = "Name of node group"
  type        = string
}

variable "eksnodegrouprolename" {
  description = "Name of node group role"
  type        = string
}