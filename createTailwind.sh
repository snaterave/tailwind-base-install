# !/bin/bash
# ========================================================
# Script para creación de proyecto base de TAILWINDCSS
# Autor: Silma Natera
# email: snatera.ve@gmail.com
# ========================================================

# Variable Global
PROJECTNAME=""
UBICACION_ACTUAL=`pwd`


# Función encargada de crear la estructura del proyecto base.
create_tailwind_project (){
    npm init -y
    npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
    npx tailwindcss init
    cat ../resources/config.text > ./tailwind.config.js
    mkdir src && cd src && mkdir css && cd css && touch tailwind.css
    echo "@tailwind base;" >> tailwind.css
    echo "@tailwind components;" >> tailwind.css
    echo "@tailwind utilities;" >> tailwind.css
    cd ../../
    touch index.html && cp ../resources/template.html index.html
    mkdir public && mv index.html public
    cd public && mkdir css && cd css && touch tailwind.css
    cd ..
    mkdir img && cp ../../resources/logo.png ./img
}

# Función para crear el directorio base.
create_project_directory () {
    mkdir $1
    echo "Directorio creado: $1"
    cd $1
    echo ""
    echo " ================================================"
    echo  "El proyecto será creado en la siguiente ruta: " 
    echo " ================================================"
    echo ""
    echo $UBICACION_ACTUAL 
    
    create_tailwind_project
}

# Solicitamos nombre del proyecto
read -p "Nombre del proyecto a crear: " PROJECTNAME

# Validamos que el usuario escriba nombre del directorio donde se guardará el proyecto base
if [  -z "$PROJECTNAME" ]; then
    echo "NOTA: Se requiere del nombre del proyecto para comenzar con la ejecución!!"
else
    create_project_directory $PROJECTNAME;   
fi  
