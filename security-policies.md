# Security Policies

## Hardcoded Secrets
- No hardcoded secrets in code (intentional for POC only).

## SQL Injection & XSS
- All user input must be sanitized (intentionally vulnerable for POC).

## Terraform
- Use supported provider/resource versions (intentionally deprecated for POC).

## GCP
- Buckets must not be public unless required.
- Database passwords must be stored in secrets.
