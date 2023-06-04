#!/bin/bash 
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read INPUT

USERNAME=$($PSQL "SELECT username FROM gamers WHERE username='$INPUT'")
USER_ID_OUTPUT=$($PSQL "SELECT user_id FROM gamers WHERE username='$INPUT'")

# if username has not been used before
if [[ -z $USERNAME ]] 
then 
  echo Welcome, $INPUT! It looks like this is your first time here.
  INSERT_USERNAME=$($PSQL "INSERT INTO gamers(username) VALUES ('$INPUT')")
else 
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN gamers USING(user_id) WHERE username='$INPUT'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games LEFT JOIN gamers USING(user_id) WHERE username='$INPUT'")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi 

# generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# variable to store number of guesses
NUMBER_OF_GUESSES=0

# prompt for a guess 
echo Guess the secret number between 1 and 1000:
read USER_GUESS

until [[ $USER_GUESS == $SECRET_NUMBER ]] 
do 
  # if guess is not an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read USER_GUESS
      ((NUMBER_OF_GUESSES++))
    else 
    # if guess is an integer 
    if [[ $USER_GUESS > $SECRET_NUMBER ]]
      then 
        # if input was higher than secret number
        echo "It's lower than that, guess again:"
        read USER_GUESS 
        ((NUMBER_OF_GUESSES++))
        # if input was lower than secret number 
      else 
      if [[ $USER_GUESS < $SECRET_NUMBER ]] 
        then 
        # if input was lower than secret number 
        echo "It's higher than that, guess again:"
        read USER_GUESS
        ((NUMBER_OF_GUESSES++))
      fi 
    fi 
  fi 
done 

# guess is correct 
((NUMBER_OF_GUESSES++))

USER_ID_OUTPUT=$($PSQL "SELECT user_id FROM gamers WHERE username='$INPUT'")
INSERT_GAME_OUTPUT=$($PSQL "INSERT INTO games(user_id, secret_number, guesses) VALUES ($USER_ID_OUTPUT, $SECRET_NUMBER, $NUMBER_OF_GUESSES)")
echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job\!
