#!/bin/bash

DEBUG="1"

echo "Esto es el inventario de Among Meme"
echo "==================================="

echo "¿Qué quieres hacer, GESTOR?"
echo "-------------------"

echo "1.- Mostrar Personajes"
echo "2.- Mostrar Inventario de un Personaje"
echo "3.- Crear Personaje"
echo "4.- Crear Item"
echo "5.- Dar Item a Personaje"
echo "Q.- Salir"

read INPUT

if [ "$INPUT" == "Q" ] || [ "$INPUT" == "q" ] || [ "$INPUT" == "" ]; then
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

elif [ "$INPUT" == "3" ]; then
	echo "Inserción de personaje"
	echo "======================"

	echo -n "Nombre: "
	read NOMBRE
	echo -n "Edad: "
	read EDAD
	echo -n "HP: "
	read HP
	echo -n "Gender (1): "
	read GENDER
	echo -n "Style (1): "
	read STYLE
	echo -n "Mana: "
	read MANA
	echo -n "Class (2): "
	read CLASS
	echo -n "Race (2): "
	read RACE
	echo -n "XP: "
	read XP
	echo -n "Level: "
	read LEVEL
	echo -n "Height: "
	read HEIGHT

	QUERY="INSERT INTO characters (name, age, hp, gender, style, mana, class, race, xp, level,height) "
	QUERY="$QUERY VALUES ('$NOMBRE', $EDAD, $HP, '$GENDER', '$STYLE', $MANA, '$CLASS', '$RACE', $XP, $LEVEL, $HEIGHT)"

	if [ $DEBUG == "1" ]; then
		echo $QUERY
	fi

	echo $QUERY | mysql -u gestor amongmeme

elif [ $INPUT == "5" ]; then
	echo "¿Qué personaje quieres usar? (id_character)"
	read ID_CHARACTER

	echo "¿Qué item quieres darle? (id_item)"
	read ID_ITEM

	QUERY="INSERT INTO characters_items (id_character, id_item)"
	QUERY="$QUERY VALUES ($ID_CHARACTER, $ID_ITEM)";

	if [ "$DEBUG" == "1" ]; then
	echo $QUERY
	fi
	echo $QUERY | mysql -u gestor amongmeme

else
		

	echo "Opción incorrecta"

fi
