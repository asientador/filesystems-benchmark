#!/bin/bash

# Crear directorio /mnt si no existe
mkdir -p /mnt/archivos/{pequenos,medianos,grandes,muy_grandes}

# Función para crear archivos de tamaño específico y llenarlos con datos aleatorios desde /dev/urandom
create_files() {
    local size=$1
    local group=$2
    local range_start=$((($group - 1) * 2500 + 1))
    local range_end=$(($group * 2500))
    local directory=$3

    echo "Creando archivos en el directorio /mnt/archivos/$directory..."

    for i in $(seq $range_start $range_end); do
        echo "Creando archivo_${size}_${i}.txt..."
        head -c $size /dev/urandom > "/mnt/archivos/$directory/archivo_${size}_${i}.txt"
    done

    echo "Archivos en el directorio /mnt/archivos/$directory creados satisfactoriamente."
}

# Archivos Pequeños (menos de 10 bytes)
# Grupo 1: 1 byte
create_files 1 1 pequenos

# Grupo 2: 3 bytes
create_files 3 2 pequenos

# Grupo 3: 6 bytes
create_files 6 3 pequenos

# Grupo 4: 9 bytes
create_files 9 4 pequenos

# Archivos Medianos (100 bytes a 4 MB)
# Grupo 1: 550 KB
create_files 550000 5 medianos

# Grupo 2: 1.5 MB
create_files 1500000 6 medianos

# Grupo 3: 2.5 MB
create_files 2500000 7 medianos

# Grupo 4: 3.5 MB
create_files 3500000 8 medianos

# Archivos Grandes (4 MB a 100 MB)
# Grupo 1: 15 MB
create_files 15000000 9 grandes

# Grupo 2: 38 MB
create_files 38000000 10 grandes

# Grupo 3: 62 MB
create_files 62000000 11 grandes

# Grupo 4: 87 MB
create_files 87000000 12 grandes

# Archivos Muy Grandes (100 MB a 500 MB)
# Grupo 1: 150 MB
create_files 150000000 13 muy_grandes

# Grupo 2: 250 MB
create_files 250000000 14 muy_grandes

# Grupo 3: 350 MB
create_files 350000000 15 muy_grandes

# Grupo 4: 460 MB
create_files 460000000 16 muy_grandes

echo "Todos los archivos han sido creados satisfactoriamente en /mnt/archivos."
