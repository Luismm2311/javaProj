#!/bin/bash

# Nombre del proyecto
PROJECT_NAME=$1
DgroupId= $2

# Verificar si se proporciona un nombre de proyecto
if [ -z "$PROJECT_NAME" ]; then
    echo "Por favor, proporciona un nombre para el proyecto."
    exit 1
fi
if [ -z "$DgroupId" ]; then
    DgroupId="com.mycompany.app"
fi

# Crear un nuevo proyecto Maven
mvn archetype:generate -DgroupId=$DgroupId -DartifactId=$PROJECT_NAME -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

# Abrir el proyecto en VS Code
code $PROJECT_NAME

