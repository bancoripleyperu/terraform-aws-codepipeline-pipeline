variable "name" {
  description = "The name of the codepipeline"
  type        = string
}

variable "role_arn" {
  description = "The arn of the role"
  type        = string
}

variable "artifact_store_location" {
  description = "the location of the artifact"
  type        = string
}

variable "artifact_store_type" {
  description = "The type of the artifact"
  type        = string
  default     = "S3"
}

variable "source_connection" {
  description = "(Optional) The arn of the connection"
  type        = string
  default     = null
}

variable "source_repository" {
  description = "(Optional) The name of the repository"
  type        = string
  default     = null
}

variable "source_branch" {
  description = "(Optional) The name of the branch"
  type        = string
  default     = null
}

variable "build_project_name" {
  description = "The name of the CodeBuild"
  type        = string
}

variable "source_s3bucket" {
  description = "(Optional) The s3 bucket of the source"
  type        = string
  default     = null
}

variable "source_s3objectkey" {
  description = "(Optional) The s3 object key of the source"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the role."
  type        = map(string)
  default     = {}
}

variable "source_owner" {
  description = "(Optional) The owner of the source"
  type        = string
  default     = "AWS"
}

variable "source_provider" {
  description = "(Optional) The provider of the source"
  type        = string
  default     = "S3"
}

variable "source_version" {
  description = "(Optional) The version of the source"
  type        = string
  default     = "1"
}