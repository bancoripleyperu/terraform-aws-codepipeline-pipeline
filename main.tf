resource "aws_codepipeline" "this" {
  name     = var.name
  role_arn = var.role_arn

  artifact_store {
    location = var.artifact_store_location
    type     = var.artifact_store_type
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = var.source_owner
      provider         = var.source_provider
      version          = var.source_version
      output_artifacts = ["Source"]

      configuration = {
        ConnectionArn    = var.source_connection
        FullRepositoryId = var.source_repository
        BranchName       = var.source_branch
        S3Bucket         = var.source_s3bucket
        S3ObjectKey      = var.source_s3objectkey
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["Source"]

      configuration = {
        ProjectName = var.build_project_name
      }
    }
  }

  tags = var.tags
}