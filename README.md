## Zero Trust CI/CD (GitHub OIDC → AWS)

This project uses GitHub Actions with AWS IAM OIDC to deploy Terraform infrastructure.
No AWS access keys are used. GitHub exchanges an OIDC token for temporary STS
credentials and assumes the GitHubOIDCDeployRole for deployments.

Benefits:
- Zero long-lived secrets
- Branch-level least privilege
- Identity-first CI/CD
