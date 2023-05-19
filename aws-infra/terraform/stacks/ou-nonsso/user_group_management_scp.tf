resource "aws_organizations_policy" "usergroup_mgnt" {
  name        = "dl-aws-nonsso-allow-usergroup-scp"
  description = "Enable User + Group Creation for organization"
  content     = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ENABLEUSERGROUPMANAGEMENT",
            "Effect": "Allow",
            "Action": [
                "iam:CreateGroup",
                "iam:AddUserToGroup",
                "iam:DeleteGroup",
                "iam:ListGroupPolicies",
                "iam:UpdateUser",
                "iam:UpdateGroup",
                "iam:ListUsers",
                "iam:DeleteUser",
                "iam:ListUserPolicies",
                "iam:ListGroups",
                "iam:CreateUser"
            ],
            "Resource": "*"
        }
    ]
}
POLICY

  tags = merge(module.this.tags, {
    Name = "dl-aws-nonsso-allow-usergroup-scp"
  })
}

resource "aws_organizations_policy_attachment" "usergroup_mgmt_scp_attach" {
  policy_id = aws_organizations_policy.usergroup_mgnt.id
  target_id = aws_organizations_organizational_unit.nonsso_ou.id
}
