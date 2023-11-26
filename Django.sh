#!/bin/bash

# Definir el nombre del entorno virtual y la ubicación
nombre_entorno="mi_entorno"
ruta_entorno="/C/Users/Agust/Desktop/"

# Defina las libreria que desea isntalar
nombre_librerias="Django " # Agrega los nombres de las libreria separados por espacio

# Definir la ruta donde se creará el proyecto Django y el nombre del proyecto
ruta_proyecto="/C/Users/Agust/Desktop/proyecto"
nombre_proyecto="mi_proyecto"
nombre_apps="app1 app2 app3"  # Agrega los nombres de las aplicaciones separados por espacio

# Creamos un entorno y lo activamos 
crear_entorno_virtual() {
  # Comando para crear el entorno virtual en una ubicación específica
  comando_creacion="python -m venv $ruta_entorno/$nombre_entorno"
  $comando_creacion

  # Comando para activar el entorno virtual (en Windows)
  comando_activacion="$ruta_entorno/$nombre_entorno/Scripts/activate"
  source "$comando_activacion"
}

# Instalammos las librerias requeriadas
intalar_librerias() {
  # Instalar las bibliotecas en el entorno virtual
  comando_instalacion="pip install $nombre_librerias"
  $comando_instalacion

}

# Cremos el proyecto
crear_proyecto_django(){
  cd $ruta_proyecto

  # Comando para crear un nuevo proyecto Django
  comando_crear_proyecto="django-admin startproject $nombre_proyecto "
  $comando_crear_proyecto
}

# Generamos archivos setting
crear_settings(){
  cd "$ruta_proyecto/$nombre_proyecto/$nombre_proyecto"
  mkdir settings
  cd settings
  touch __init__.py prod.py local.py base.py

  # Ruta del directorio donde se encuentra el archivo a buscar
  directorio_busqueda="$ruta_proyecto/$nombre_proyecto/$nombre_proyecto"
  # Nombre del archivo que deseas buscar y copiar su contenido
  archivo_buscar="settings.py"
  # Ruta del directorio donde se copiará el contenido del archivo
  directorio_destino="$ruta_proyecto/$nombre_proyecto/$nombre_proyecto/settings"
  # Nombre del archivo de destino donde se copiará el contenido
  archivo_destino="base.py"

  # Verifica si el archivo a buscar existe en el directorio de búsqueda
  if [ -f "$directorio_busqueda/$archivo_buscar" ]; then
    # Copia el contenido del archivo a un nuevo archivo de destino
    cat "$directorio_busqueda/$archivo_buscar" > "$directorio_destino/$archivo_destino"
  else
    echo "El archivo '$archivo_buscar' no fue encontrado en '$directorio_busqueda'."
  fi
}

crear_apps(){
  # Crear el directorio 'apps' en el proyecto
  mkdir "$ruta_proyecto/$nombre_proyecto/apps"
  cd "$ruta_proyecto/$nombre_proyecto/apps"
  touch __init__.py

  # Recorre los nombre de las apps y las va generando
  IFS=' ' read -r -a apps_array <<< "$nombre_apps"

  for app in "${apps_array[@]}"
  do
    comando_crear_apps="django-admin startapp $app"
    $comando_crear_apps
  done
}

crear_entorno_virtual
intalar_librerias
crear_proyecto_django
crear_settings
crear_apps
