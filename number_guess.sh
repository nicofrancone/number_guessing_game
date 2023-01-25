#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guessing_game --tuples-only -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER
N=0

echo "Enter your username:"
read USERNAME
USERNAME_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USERNAME_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE user_id=$USERNAME_ID")
  echo $USER | while read USER_N BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USER_N! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi


GUESS_GAME() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo "Guess the secret number between 1 and 1000:"
  fi

  ((N+=1))
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_GAME "That is not an integer, guess again:"
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    GUESS_GAME "It's lower than that, guess again:"
  elif [[ $GUESS -lt $RANDOM_NUMBER ]] 
  then
    GUESS_GAME "It's higher than that, guess again:"
  else
    echo "You guessed it in $N tries. The secret number was $RANDOM_NUMBER. Nice job!"   
  fi
  
}

GUESS_GAME

if [[ -z $USERNAME_ID ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $N)")
else
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USERNAME_ID")
  if [[ $N -lt $BEST_GAME ]]
  then
    UPDATED_BEST_GAME=$($PSQL "UPDATE users SET best_game=$N WHERE user_id=$USERNAME_ID")
  fi
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USERNAME_ID")
  ((GAMES_PLAYED+=1))
  UPDATED_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USERNAME_ID")
fi
