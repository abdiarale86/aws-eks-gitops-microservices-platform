cat > docs/decisions/001-use-s3-native-terraform-state-locking.md << 'EOF'
# ADR 001: Use Amazon S3 Native Locking for Terraform State

## Status

Accepted

## Date

2026-07-17

## Context

Terraform state records the relationship between the Terraform configuration
and the AWS resources managed by the project.

Keeping state only on one developer laptop creates several risks:

- The state could be lost if the computer fails.
- Multiple users or pipelines could accidentally change the same state.
- The state would not have centralized version history.
- Local state is difficult to use safely from automated workflows.

The project requires separate Terraform state for development, production,
and shared bootstrap infrastructure.

## Decision

Use one dedicated Amazon S3 bucket as the Terraform remote backend.

The bucket will use:

- S3 versioning
- AES-256 server-side encryption
- S3 Block Public Access
- BucketOwnerEnforced object ownership
- An HTTPS-only bucket policy
- Terraform lifecycle protection against accidental destruction
- Native S3 state locking through `use_lockfile = true`

State will be separated by S3 object keys:

```text
bootstrap/terraform.tfstate
dev/terraform.tfstate
