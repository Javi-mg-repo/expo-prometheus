# Proyecto de Monitoreo con Prometheus en Docker

![Prometheus Logo](https://upload.wikimedia.org/wikipedia/commons/3/38/Prometheus_software_logo.svg)

Este proyecto configura un entorno de monitoreo con **Prometheus**, usando **Docker Compose** y un sistema de plantillas con variables de entorno.

---

## Inicio
Se debe disponer de un archivo `.env` en donde estén todas las claves que utiliza la `prometheus.template.yml`.
### Componentes del `.env`
- `DB_USER`: Nombre del usuario de la BBDD.
- `DB_PASSWORD`: Contraseña del `DB_USER`.
- `TOKEN`: Clave Bearer del workspace de Databricks.
- `CLUSTER_ID`: El ID del Cluster de databricks.
- `CLUSTER_NAME` : Nombre del Cluster de databricks.
- `DATABRICKS_URL`: Nombre del host.
### Paso 1

En el directorio del proyecto, ejecutar:
``` {.sourceCode .bash}
$ .\generate-config.ps1
```
Se habrá generado el archivo `prometheus.yml`, por lo que simplemente habría que realizar un `docker-compose up -d` para desplegar los servicios de Grafana y Prometheus en Docker.



