#!/usr/bin/bash 

###Opcion avanzada###
file=$1 #Toma argumentos
num=$2
output_dir=$3
total_lines=$(wc -l ${file} | cut -d ' ' -f 1) #Extrae total de lineas
cutfile_name=$(echo ${file} | grep -o '[^/]*$') #Crea nombre de salida, el ultimo campo de la ruta 
counter=1
cat ${file} | while read line; do
	if [ $((counter % num)) -eq 0 ]; then
		echo ${line} >> ${cutfile_name}
	fi
	counter=$((counter+1))
done 
mv  ${cutfile_name} ${output_dir} #Lleva los resultados al directorio

