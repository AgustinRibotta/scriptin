# Cambia al directorio del proyecto
source /c/Users/Agust/Desktop/mi_entorno/Scripts

# Activa el entorno virtual
cd /c/Users/Agust/Desktop/proyecto/mi_proyecto

# Abre el navegador en la dirección local
start http://127.0.0.1:8000/

# Ejecuta el proyecto en segundo plano
python manage.py runserver
# nohup python manage.py runserver > #/d/Programacion/Proyectos/Beto/tiendita/salida.txt 2>&1 &
