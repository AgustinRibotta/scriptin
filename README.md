## Proyecto en Progreso

**¡Atención! Este proyecto está actualmente en desarrollo y puede no estar completamente funcional. Se están realizando cambios y mejoras regularmente.**

Si encuentras problemas o tienes sugerencias, no dudes en abrir un problema o contribuir con una solicitud de extracción. Agradecemos tu paciencia y contribuciones.


# **Generador Automático de Proyectos Django con Docker**

## Descripción

Este proyecto proporciona un script que genera automáticamente un nuevo proyecto Django dentro de un contenedor Docker. La automatización incluye la configuración inicial del proyecto, la instalación de dependencias y la preparación para el desarrollo y la implementación.

## Requisitos Previos

- [Docker](https://www.docker.com/get-started) instalado en tu máquina

## Uso

1. Clona este repositorio en tu máquina local:

```bash
 git clone https://github.com/tu-usuario/tu-proyecto.git
```
2. Accede al directorio del proyecto:

```bash
cd tu-proyecto
```

3. Construye la imagen de Docker:

```bash
docker build -t generador-django .
```

4. Ejecuta el script para generar un nuevo proyecto Django:

```bash
docker run -it --rm -v $(pwd):/app generador-django nombre_del_proyecto
```



