# CI/CD Runbooks

## Pipeline Troubleshooting
- Check GitHub Actions logs for failed jobs.
- Validate Terraform plan/apply output for errors.
- Ensure GCP credentials are set in repository secrets.

## Dependency Updates
- For Node.js: update package.json, run npm install, commit package-lock.json.
- For Python: update requirements.txt, run pip freeze > requirements.lock, commit both files.
