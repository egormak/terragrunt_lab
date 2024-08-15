# Backend S3 Minio
## Run S3 Minio
Run S3 Minio Server for terraform state, `docker-compose.yaml`:
```yaml
version: '3.7'

services:
  minio:
    image: minio/minio
    ports:
      - "9000:9000"
      - "9001:9001"
    volumes:
      - minio_storage:/data
    environment:
      MINIO_ROOT_USER: minioadmin
      MINIO_ROOT_PASSWORD: minioadmin
    command: server --console-address ":9001" /data

volumes:
  minio_storage: {}
```
## Create Bucket
Create bucket with name `terraform-state`.

# Create Virtual Machines Services
## Kubernetes VM
```shell
cd live/vms/kubernetes-servers
terragrunt apply
```

# Prepare for Terragrunt
## Get GitHub Token
Create token in Github:
- Use link: https://github.com/settings/tokens
- Generate new token
- Set token in `live/egorka/flux/terragrunt.hcl` => `github_token = "TOKEN"`


# Deploy
```shell
cd live/prod
terragrunt run-all plan
```
### Run only one project
```shell
cd live/prod/cilium
terragrunt apply
```
