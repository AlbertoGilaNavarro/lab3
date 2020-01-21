#!/usr/bin/bash 

###Opcion avanzada###
file=$1 #Toma argumentos
num=$2
output_dir=$3
total_lines=$(wc -l ${file} | cut -d ' ' -f 1) #Extrae total de lineas
cutfile_name=$(echo ${file} | grep -o '[^/]*$') #Crea nombre de salida, el ultimo campo de la ruta 
for index in $(seq 1 ${total_lines}); do #Extrae lineas multiplo de num
	if [ $((index % num)) -eq 0 ]; then
		head -${index} ${file} | tail -1 >> ${cutfile_name}
	fi
done
mv ${cutfile_name} ${output_dir} #Lleva los resultados al directorio

