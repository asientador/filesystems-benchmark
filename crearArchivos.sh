#!/bin/bash

# Función para generar archivos pequeños
generate_small_files() {
    local min_size=$1
    local max_size=$2
    local folder=$3

    mkdir -p "$folder"
    for (( i=1; i<=2500; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/zero of="$folder/file_$i" bs=1 count=$size &>/dev/null
    done
}

# Función para generar archivos medianos
generate_medium_files() {
    local min_size=$1
    local max_size=$2
    local folder=$3

    mkdir -p "$folder"
    for (( i=1; i<=2500; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/zero of="$folder/file_$i" bs=1 count=$size &>/dev/null
    done
}

# Función para generar archivos grandes
generate_large_files() {
    local min_size=$1
    local max_size=$2
    local folder=$3

    mkdir -p "$folder"
    for (( i=1; i<=2500; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/zero of="$folder/file_$i" bs=1M count=$size &>/dev/null
    done
}

# Función para generar archivos muy grandes
generate_very_large_files() {
    local min_size=$1
    local max_size=$2
    local folder=$3

    mkdir -p "$folder"
    for (( i=1; i<=2500; i++ )); do
        size=$(shuf -i $min_size-$max_size -n 1)
        dd if=/dev/zero of="$folder/file_$i" bs=1M count=$size &>/dev/null
    done
}

# Crear subcarpetas y generar archivos pequeños
echo "Generando archivos pequeños..."
generate_small_files 1 1 "/mnt/Archivos_Pequeños/Menos_de_2_bytes"
generate_small_files 2 4 "/mnt/Archivos_Pequeños/2_a_4_bytes"
generate_small_files 4 8 "/mnt/Archivos_Pequeños/4_a_8_bytes"
generate_small_files 8 10 "/mnt/Archivos_Pequeños/8_a_10_bytes"
echo "Archivos pequeños generados."

# Crear subcarpetas y generar archivos medianos
echo "Generando archivos medianos..."
generate_medium_files 100 1048576 "/mnt/Archivos_Medianos/100_bytes_a_1MB"
generate_medium_files 1048577 2097152 "/mnt/Archivos_Medianos/1MB_a_2MB"
generate_medium_files 2097153 3145728 "/mnt/Archivos_Medianos/2MB_a_3MB"
generate_medium_files 3145729 4194304 "/mnt/Archivos_Medianos/3MB_a_4MB"
echo "Archivos medianos generados."

# Crear subcarpetas y generar archivos grandes
echo "Generando archivos grandes..."
generate_large_files 4194304 26214400 "/mnt/Archivos_Grandes/4MB_a_25MB"
generate_large_files 26214401 52428800 "/mnt/Archivos_Grandes/25MB_a_50MB"
generate_large_files 52428801 78643200 "/mnt/Archivos_Grandes/50MB_a_75MB"
generate_large_files 78643201 104857600 "/mnt/Archivos_Grandes/75MB_a_100MB"
echo "Archivos grandes generados."

# Crear subcarpetas y generar archivos muy grandes
echo "Generando archivos muy grandes..."
generate_very_large_files 104857600 209715200 "/mnt/Archivos_Muy_Grandes/100MB_a_200MB"
generate_very_large_files 209715201 314572800 "/mnt/Archivos_Muy_Grandes/200MB_a_300MB"
generate_very_large_files 314572801 419430400 "/mnt/Archivos_Muy_Grandes/300MB_a_400MB"
generate_very_large_files 419430401 545259520 "/mnt/Archivos_Muy_Grandes/400MB_a_520MB"
echo "Archivos muy grandes generados."

echo "¡Proceso completado!"
