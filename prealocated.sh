#!/bin/bash

# Tamaños de archivo a probar
tamaños=("1" "3" "6" "9")

# Número de repeticiones
repeticiones=2500

# Directorio de salida para los resultados
output_dir="resultados_iozone"

# Crear directorio de salida si no existe
mkdir -p $output_dir

# Iterar sobre cada tamaño de archivo
for tamaño in "${tamaños[@]}"
do
    # Nombre del archivo de salida
    output_file="${output_dir}/iozone_${tamaño}bytes_results.txt"

    # Ejecutar iozone para cada prueba
    iozone -w -c -e -i 0 -+n -s $tamaño -r $tamaño -l $repeticiones > $output_file

    echo "Prueba con tamaño de archivo ${tamaño} bytes completada. Resultados en ${output_file}"
done
