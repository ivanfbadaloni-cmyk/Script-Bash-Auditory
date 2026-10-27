# Auditoría Linux con Bash

Descripción

Este proyecto consiste en un script desarrollado en Bash para realizar comprobaciones básicas y recopilar información relevante sobre un sistema Linux.

La idea surge como parte de mi aprendizaje en Linux, scripting y ciberseguridad, buscando aplicar conocimientos de forma práctica y automatizar algunas tareas habituales de administración y revisión del sistema.

El script genera un reporte con información general del equipo, uso de recursos, procesos en ejecución, usuarios, puertos en escucha, registros de accesos SSH y actualizaciones disponibles.

Es un proyecto personal en desarrollo, pensado para resolver consultas básicas del sistema de forma sencilla y centralizada.

Funcionalidades

Información general del sistema, hostname y kernel.

Tiempo de actividad del equipo.

Uso de disco y memoria RAM.

Usuarios conectados y usuarios registrados en el sistema.

Puertos en escucha y estado de UFW.

Procesos que más CPU y memoria consumen.

Últimos accesos registrados.

Consulta de intentos fallidos de autenticación SSH.

Identificación de las IP con más intentos fallidos registrados.

Listado de actualizaciones disponibles.

Tecnologías utilizadas

Bash

Linux

Herramientas de administración del sistema

journalctl, ss, ps, df, free, ufw y otras utilidades de consola.

Uso

El script está pensado para ejecutarse desde una terminal en un sistema Linux compatible.

Descargar o clonar el repositorio.

Dar permisos de ejecución al archivo.

Ejecutar el script con los permisos necesarios para consultar los registros y la información del sistema.

chmod +x Auditoria-Linux.sh
sudo ./Auditoria-Linux.sh

El reporte se guarda en /var/log/ con la fecha y hora de ejecución en el nombre del archivo.

Objetivo del proyecto

Mi objetivo es seguir practicando Bash y profundizar mis conocimientos sobre Linux, automatización de tareas y seguridad informática.

Este proyecto representa una primera aproximación a la creación de herramientas propias para facilitar tareas básicas de revisión y administración de sistemas. La idea es continuar incorporando mejoras a medida que avance en mi aprendizaje.

Aviso

Este script es una herramienta de consulta y recopilación de información. No realiza una auditoría de seguridad exhaustiva ni garantiza que un sistema esté libre de vulnerabilidades.

Se recomienda ejecutarlo únicamente en sistemas propios o sobre los que se tenga autorización, teniendo en cuenta que el reporte puede contener información sensible.

Estado del proyecto

En desarrollo. Se prevén futuras mejoras en el manejo de errores, compatibilidad entre distribuciones y presentación de los reportes.
