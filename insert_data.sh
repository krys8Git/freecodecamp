#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# loop through csv to insert teams
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  # skip header
  if [[ $WINNER != 'winner' ]]
  then
    # check if winner exists
    if [[ -z $($PSQL "select name from teams where name='$WINNER'") ]]
    then
      WINNER_INSERT=$($PSQL "insert into teams(name) values('$WINNER')")
    fi

    # check if opponent exsits
    if [[ -z $($PSQL "select name from teams where name='$OPPONENT'") ]]
    then
      OPPONENT_INSERT=$($PSQL "insert into teams(name) values('$OPPONENT')")
    fi
  fi
done

# loop through csv to insert games
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  # skip header
  if [[ $YEAR != 'year' ]]
  then
    # find winner and opponent id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    # insert game into games table
    GAME_INSERT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WGOALS,$OGOALS)")
  fi
done