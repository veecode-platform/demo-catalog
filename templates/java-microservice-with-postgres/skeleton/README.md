# ${{ values.componentName }}

${{ values.description }}

## Local development

You need a Postgres reachable on `localhost:5432`. Quickest path:

```bash
docker run --rm -d \
  --name ${{ values.componentName }}-db \
  -e POSTGRES_DB=${{ values.dbName }} \
  -e POSTGRES_USER=app \
  -e POSTGRES_PASSWORD=app \
  -p 5432:5432 \
  postgres:16

mvn spring-boot:run
```

Flyway migrations under `src/main/resources/db/migration/` apply automatically at startup.
Health probe at `/actuator/health` — DB component included.

## Build

```bash
mvn -B verify
docker build -t ${{ values.componentName }}:local .
```

## Infrastructure

The `terraform/` directory provisions an AWS RDS Postgres instance backing this service.

```bash
cd terraform
terraform init
# Fill in vpc_id, subnet_ids, allowed_cidrs in terraform.tfvars
terraform apply
```

Outputs (`db_endpoint`, `db_name`, `db_username`, `db_password`) are designed to be piped
straight into GitHub Environment secrets for the deploy workflow.

## Layout

```
src/main/java/com/demo/app/         Application + entity + repo + controller
src/main/resources/application.yml  Datasource + JPA config
src/main/resources/db/migration/    Flyway migrations
terraform/                          AWS RDS module (Postgres 16)
.github/workflows/ci.yml            Build + test against Postgres service container
Dockerfile                           Multi-stage build (Java 21)
```
