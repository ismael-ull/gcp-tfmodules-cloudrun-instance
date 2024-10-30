/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region to deploy the Cloud Run service"
  type        = string  
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "Container image to deploy"
  type        = string
}

variable "cpu" {
  description = "The number of CPUs to allocate to the container"
  type        = string
  default     = "1"
}

variable "memory" {
  description = "The amount of memory to allocate to the container"
  type        = string
  default     = "512Mi"
}

variable "env_vars" {
  description = "A list of environment variables to set in the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "service_account_email" {
  description = "The email of the service account to run the Cloud Run service"
  type        = string
}