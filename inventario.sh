#!/bin/bash

echo "Esto es el inventario de Among Meme"
echo "==================================="

echo "¿Qué quieres hacer?"
echo "-------------------"

echo "1.- Mostrar Personajes"
echo "2.- Mostrar Inventario de un Personaje"
echo "3.- Salir"

read INPUT

if [ "$INPUT" == "3" ] || [ "$INPUT" == "" ]; then
	echo "Pos hasta luego"
	exit 0
fi

if [ "$INPUT" == "1" ]; then

	echo "Personaje:"
	
	echo "select id_character,name  from characters" | mysql -u consulta amongmeme

elif [ "$INPUT" == "2" ]; then

	echo "Inventario"
	echo "=========="
	echo "¿De qué personaje quieres ver el inventario?"

	read INPUT

	if [ "$INPUT" == "" ]; then
		echo "Has de introducir algún valor"
		exit 1
	fi
	echo "select * from chars_items where id_character=$INPUT" | mysql -u consulta amongmeme | cut -d $'\t' -f 4

else

	echo "Opción incorrecta"

fi
