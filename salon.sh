#! /bin/bash

# login
P="psql --username=freecodecamp --dbname=salon -t --no-align -c "

echo -e "\n~~~~ My Salon ~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  # list services and ask for input until legit service is selected
  SERVICE_NAME=''
  while [[ -z $SERVICE_NAME ]]
  do
    # list services
    echo "$($P "select service_id, name from services")" | while IFS='|' read ID NAME
    do
      echo "$ID) $NAME"
    done

    # user input for service selection
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($P "select name from services where service_id=$SERVICE_ID_SELECTED")
    if [[ $SERVICE_NAME == '' ]]
    then
      echo -e "\nI could not find that service. What would you like today?"
    fi
  done

  # selected service exists; user input phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_VALID=$($P "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  # if phone number not in system
  if [[ -z $PHONE_VALID ]]
  then
    # collect new customer info and insert into system
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    ADD_CUSTOMER=$($P "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  else
    CUSTOMER_NAME=$($P "select name from customers where phone='$CUSTOMER_PHONE'")
  fi

  # get customer_id
  CUSTOMER_ID=$($P "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  
  # user input for appointment time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # add appointment to system
  APPT_VALID=$($P "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

MAIN_MENU