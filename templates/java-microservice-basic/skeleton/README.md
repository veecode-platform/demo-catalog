# ${{ values.componentName }}

${{ values.description }}

## Local development

```bash
mvn spring-boot:run
```

Service listens on `http://localhost:8080`. Health probe at `/actuator/health`.

## Build

```bash
mvn -B verify
docker build -t ${{ values.componentName }}:local .
```

## Layout

```
src/main/java/com/demo/app/        Application + controllers
src/main/resources/application.yml Config
.github/workflows/ci.yml           Build + test + image on push/PR
Dockerfile                          Multi-stage build (Java 21)
```

## Catalog

Registered in Backstage as component `${{ values.componentName }}`, owned by `${{ values.owner }}`.
See `catalog-info.yaml`.
