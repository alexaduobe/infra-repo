data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "dl" {}

data "aws_canonical_user_id" "current" {}

data "aws_partition" "current" {}
