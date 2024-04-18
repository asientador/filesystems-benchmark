#!/bin/bash

# Crear directorio /mnt si no existe
mkdir -p /mnt/archivos_pequenos

# Función para crear archivos de tamaño específico
create_files() {
    local size=$1
    local group=$2
    local range_start=$((($group - 1) * 2500 + 1))
    local range_end=$(($group * 2500))

    for i in $(seq $range_start $range_end); do
        echo -n "Contenido" > "/mnt/archivos_pequenos/archivo_${size}_${i}.txt"
    done
}

# Crear archivos de 1 byte
create_files 1 1

# Crear archivos de 3 bytes
create_files 3 2

# Crear archivos de 6 bytes
create_files 6 3

# Crear archivos de 9 bytes
create_files 9 4

echo "Archivos creados satisfactoriamente en /mnt/archivos_pequenos."
