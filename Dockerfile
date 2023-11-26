FROM python:3.12.0-alpine3.18

# Actualiza e instala dos2unix
RUN apk update && apk upgrade && apk add dos2unix

# Designamos el directorio de trabajo
WORKDIR /app
# Copia los archivos necesarios
COPY ./ ./

# Convierte el script para eliminar los caracteres de retorno de carro
RUN dos2unix Django.py

# Establece permisos de ejecución
RUN chmod +x Django.py

