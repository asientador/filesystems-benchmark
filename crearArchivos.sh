#!/bin/bash

# Crear directorios para los diferentes tipos de archivos
mkdir "Archivos Pequeños" "Archivos Medianos" "Archivos Grandes" "Archivos Muy Grandes"

# Función para generar archivos pequeños
generate_small_files() {
    local size=$1
    local total=$2
    local range=$3
    local folder=$4

    for (( i=1; i<=$total; i++ )); do
        dd if=/dev/urandom of="$folder/file_$i" bs=1 count=$size &>/dev/null
    done
}

# Función para generar archivos medianos
generate_medium_files() {
    local min_size=$1
    local max_size=$2
    local total=$3
    local folder=$4

    for (( i=1; i<=$total; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/urandom of="$folder/file_$i" bs=1 count=$size &>/dev/null
    done
}

# Función para generar archivos grandes
generate_large_files() {
    local min_size=$1
    local max_size=$2
    local total=$3
    local folder=$4

    for (( i=1; i<=$total; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/urandom of="$folder/file_$i" bs=1M count=$size &>/dev/null
    done
}

# Función para generar archivos muy grandes
generate_very_large_files() {
    local min_size=$1
    local max_size=$2
    local total=$3
    local folder=$4

    for (( i=1; i<=$total; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/urandom of="$folder/file_$i" bs=1M count=$size &>/dev/null
    done
}

# Generar archivos pequeños
echo "Generando archivos pequeños..."
generate_small_files 1 2500 "1-2" "Archivos Pequeños/Grupo1"
generate_small_files 3 2500 "2-4" "Archivos Pequeños/Grupo2"
generate_small_files 6 2500 "4-8" "Archivos Pequeños/Grupo3"
generate_small_files 9 2500 "8-10" "Archivos Pequeños/Grupo4"
echo "Archivos pequeños generados."

# Generar archivos medianos
echo "Generando archivos medianos..."
generate_medium_files 102400 1048576 2500 "Archivos Medianos/Grupo1"
generate_medium_files 1048577 2097152 2500 "Archivos Medianos/Grupo2"
generate_medium_files 2097153 3145728 2500 "Archivos Medianos/Grupo3"
generate_medium_files 3145729 4194304 2500 "Archivos Medianos/Grupo4"
echo "Archivos medianos generados."

# Generar archivos grandes
echo "Generando archivos grandes..."
generate_large_files 15 25 2500 "Archivos Grandes/Grupo1"
generate_large_files 38 50 2500 "Archivos Grandes/Grupo2"
generate_large_files 62 75 2500 "Archivos Grandes/Grupo3"
generate_large_files 87 100 2500 "Archivos Grandes/Grupo4"
echo "Archivos grandes generados."

# Generar archivos muy grandes
echo "Generando archivos muy grandes..."
generate_very_large_files 150 200 2500 "Archivos Muy Grandes/Grupo1"
generate_very_large_files 250 300 2500 "Archivos Muy Grandes/Grupo2"
generate_very_large_files 350 400 2500 "Archivos Muy Grandes/Grupo3"
generate_very_large_files 460 520 2500 "Archivos Muy Grandes/Grupo4"
echo "Archivos muy grandes generados."

echo "¡Proceso completado!"
