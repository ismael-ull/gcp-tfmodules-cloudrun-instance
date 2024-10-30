# Google Cloud Run Terraform Module

This Terraform module deploys a service to Google Cloud Run. It allows you to specify various configurations such as the container image, resource limits, environment variables, and service account.

## Features

- Deploys a containerized application to Google Cloud Run
- Configures resource limits (CPU and memory) for the container
- Sets environment variables for the container
- Assigns a service account to the Cloud Run service
- Configures IAM permissions to allow public access

## Usage

To use this module, include it in your Terraform configuration and provide the necessary variables:

```hcl
module "cloud_run_service" {
  source = "./path-to-your-module"

  project_id            = "your-gcp-project-id"
  region                = "us-central1"
  service_name          = "my-cloud-run-service"
  image                 = "gcr.io/your-project/your-image:tag"
  cpu                   = "1"
  memory                = "512Mi"
  env_vars              = [
    {
      name  = "ENV_VAR_NAME"
      value = "value"
    }
  ]
  service_account_email = "your-service-account@your-project.iam.gserviceaccount.com"
}
```

## Inputs

| Name                   | Description                                           | Type   | Default  | Required |
|------------------------|-------------------------------------------------------|--------|----------|----------|
| `project_id`           | GCP project ID                                        | `string` | n/a      | yes      |
| `region`               | Region to deploy the Cloud Run service                | `string` | n/a      | yes      |
| `service_name`         | The name of the Cloud Run service                     | `string` | n/a      | yes      |
| `image`                | Container image to deploy                             | `string` | n/a      | yes      |
| `cpu`                  | The number of CPUs to allocate to the container       | `string` | `1`      | no       |
| `memory`               | The amount of memory to allocate to the container     | `string` | `512Mi`  | no       |
| `env_vars`             | A list of environment variables to set in the container | `list(object({name = string, value = string}))` | `[]` | no |
| `service_account_email`| The email of the service account to run the Cloud Run service | `string` | n/a | yes |

## Outputs

| Name          | Description                              |
|---------------|------------------------------------------|
| `service_url` | The URL of the deployed Cloud Run service |

## Requirements

- Terraform 0.12 or later
- Google Cloud Platform account with necessary permissions
- Enabled Cloud Run API in your GCP project

## Notes

- Ensure that the specified `region` is available for Cloud Run in your GCP project.
- The `service_account_email` should have the necessary permissions to run the Cloud Run service.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
