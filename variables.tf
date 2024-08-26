variable "project_id" {
  default     = "dmap-390317"
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "attachment_project_id" {
  default     = "dmap-390317"
  description = "The ID of the project in which attachment will be provisioned"
  type        = string
}

variable "attachment_project_number" {
  default     = "702518596407"
  description = "The project number in which attachment will be provisioned"
  type        = string
}

variable "region_delhi" {
  default     = "asia-south2"
  description = "The region for cluster in delhi asia"
  type        = string
}

variable "region_mumbai" {
  default     = "asia-south1"
  description = "The region for cluster in mumbai asia"
  type        = string
}