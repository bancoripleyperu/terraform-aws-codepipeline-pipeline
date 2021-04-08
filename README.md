## Usage

```hcl
module "this" {
  source  = "bancoripleyperu/codepipeline-pipeline/aws"
  version = "0.0.1"

  name                    = "myPipeline"
  role_arn                = module.iam-role.values.arn
  artifact_store_location = module.s3-bucket.values.id
  source_s3bucket         = module.s3-bucket.values.id
  source_s3objectkey      = "build"
  build_project_name      = module.codebuild-project.values.id
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_store_location"></a> [artifact\_store\_location](#input\_artifact\_store\_location) | the location of the artifact | `string` | n/a | yes |
| <a name="input_artifact_store_type"></a> [artifact\_store\_type](#input\_artifact\_store\_type) | The type of the artifact | `string` | `"S3"` | no |
| <a name="input_build_project_name"></a> [build\_project\_name](#input\_build\_project\_name) | The name of the CodeBuild | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the codepipeline | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The arn of the role | `string` | n/a | yes |
| <a name="input_source_branch"></a> [source\_branch](#input\_source\_branch) | (Optional) The name of the branch | `string` | `null` | no |
| <a name="input_source_connection"></a> [source\_connection](#input\_source\_connection) | (Optional) The arn of the connection | `string` | `null` | no |
| <a name="input_source_owner"></a> [source\_owner](#input\_source\_owner) | (Optional) The owner of the source | `string` | `"AWS"` | no |
| <a name="input_source_provider"></a> [source\_provider](#input\_source\_provider) | (Optional) The provider of the source | `string` | `"S3"` | no |
| <a name="input_source_repository"></a> [source\_repository](#input\_source\_repository) | (Optional) The name of the repository | `string` | `null` | no |
| <a name="input_source_s3bucket"></a> [source\_s3bucket](#input\_source\_s3bucket) | (Optional) The s3 bucket of the source | `string` | `null` | no |
| <a name="input_source_s3objectkey"></a> [source\_s3objectkey](#input\_source\_s3objectkey) | (Optional) The s3 object key of the source | `string` | `null` | no |
| <a name="input_source_version"></a> [source\_version](#input\_source\_version) | (Optional) The version of the source | `string` | `"1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_values"></a> [values](#output\_values) | All outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

```sh
gem install bundler
bundle install --jobs 4 --retry 3
bundle exec kitchen test
```

## Doc

```sh
pre-commit run -a
```

## Autor
 
Module managed by [Banco Ripley Peru](https://ripley.com.pe)