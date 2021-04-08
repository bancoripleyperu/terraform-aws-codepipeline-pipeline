module "this" {
  source = "../../"

  name                    = "titan-dev-test"
  role_arn                = module.iam-role.values.arn
  artifact_store_location = module.s3-bucket.values.id
  source_s3bucket         = module.s3-bucket.values.id
  source_s3objectkey      = "build"
  build_project_name      = module.codebuild-project.values.id

  tags = {
    Project = "titan"
  }
}

# dependencies
module "s3-bucket" {
  source  = "bancoripleyperu/s3-bucket/aws"
  version = "0.0.4"

  bucket = "titan-dev-test-pipeline"

  tags = {
    Project = "titan"
  }
}

module "iam-role" {
  source  = "bancoripleyperu/iam-role/aws"
  version = "0.0.3"

  name         = "titan-dev-test"
  aws_services = ["codepipeline.amazonaws.com", "codebuild.amazonaws.com"]

  tags = {
    Project = "titan"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.iam-role.values.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

module "codebuild-project" {
  source  = "bancoripleyperu/codebuild-project/aws"
  version = "0.0.2"

  name             = "titan-dev-test"
  service_role     = module.iam-role.values.arn
  source_type      = "CODEPIPELINE"
  artifacts_type   = "CODEPIPELINE"
  source_buildspec = file("buildspec.yml")

  tags = {
    Project = "titan"
  }
}
