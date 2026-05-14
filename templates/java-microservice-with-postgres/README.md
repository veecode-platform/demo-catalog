# Java Microservice — Spring Boot + RDS Postgres

Spring Boot 3 service with persistence wired end-to-end **and** the infra to back it. Use this when your service owns its data: transactional APIs, domain microservices, write-heavy aggregators.

If the service is stateless or only reads from somebody else's database, pick `java-microservice-basic` instead.

## What you get

**Application layer**
- Spring Boot 3.3 on Java 21 (Maven)
- Spring Data JPA + PostgreSQL JDBC driver
- Flyway migrations (`db/migration/`) — runs at startup, also in CI
- One example entity + repository + REST controller (delete or reshape)
- Multi-stage Dockerfile, `/actuator/health` with DB component
- GitHub Actions CI: build, test against a Postgres container service

**Infra layer**
- Terraform module under `terraform/` provisioning:
  - `aws_db_instance` (Postgres 16, encrypted, configurable instance class)
  - DB subnet group + dedicated security group (port 5432 from `allowed_cidrs`)
  - Generated master password via `random_password`, output as sensitive
- Variables for `vpc_id`, `subnet_ids`, `allowed_cidrs`, `instance_class`, `environment`
- Outputs the JDBC endpoint + credentials for piping into GitHub Environment secrets

## Parameters

| Name | Required | Notes |
|---|---|---|
| `componentName` | yes | kebab-case (e.g. `orders-api`). |
| `description` | yes | One-line summary. |
| `owner` | yes | Owning team. |
| `repoUrl` | yes | GitHub destination. |
| `dbName` | yes | Postgres database name (defaults to `componentName` with `-`→`_`). |

## Tags

`sankhya-demo`, `java`, `microservice`, `spring-boot`, `postgres`, `database`, `terraform`, `rds`
