#!/bin/bash

# Crear directorio /mnt si no existe
mkdir -p /mnt/archivos

# Función para crear archivos de tamaño específico y llenarlos con datos aleatorios desde /dev/urandom
create_files() {
    local size=$1
    local group=$2
    local range_start=$((($group - 1) * 2500 + 1))
    local range_end=$(($group * 2500))

    for i in $(seq $range_start $range_end); do
        head -c $size /dev/urandom > "/mnt/archivos/archivo_${size}_${i}.txt"
    done
}

# Archivos Medianos (100 bytes a 4 MB)
# Grupo 1: 550 KB
create_files 550000 1

# Grupo 2: 1.5 MB
create_files 1500000 2

# Grupo 3: 2.5 MB
create_files 2500000 3

# Grupo 4: 3.5 MB
create_files 3500000 4

# Archivos Grandes (4 MB a 100 MB)
# Grupo 1: 15 MB
create_files 15000000 5

# Grupo 2: 38 MB
create_files 38000000 6

# Grupo 3: 62 MB
create_files 62000000 7

# Grupo 4: 87 MB
create_files 87000000 8

# Archivos Muy Grandes (100 MB a 500 MB)
# Grupo 1: 150 MB
create_files 150000000 9

# Grupo 2: 250 MB
create_files 250000000 10

# Grupo 3: 350 MB
create_files 350000000 11

# Grupo 4: 460 MB
create_files 460000000 12

echo "Archivos creados satisfactoriamente en /mnt/archivos."
