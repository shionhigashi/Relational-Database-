#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

# no input given 
if [[ -z $1 ]] 
  then 
  echo Please provide an element as an argument.
else 
  # input is atomic number 
  if [[ $1 =~ ^[1-9]+$ ]] 
    then 
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = '$1'")
  else 
    # input is name or symbol
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name = '$1' or symbol = '$1'")
  fi 
  # element does not exist in database 
  if [[ -z $ELEMENT ]] 
    then 
    echo I could not find that element in the database.
    else 
    echo $ELEMENT | while IFS=" |" read number name symbol type mass mp bp 
    do
    echo "The element with atomic number $number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
done
  fi 
fi






