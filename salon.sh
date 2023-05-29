#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) PERM ;;
    4) STYLE ;;
    5) TRIM ;;
    *) MAIN_MENU "\nI could not find that service. What would you like today?";;
  esac 
} 

CUT() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = 1")
} 

COLOR() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = 2")
} 

PERM() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = 3")
} 

STYLE() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = 4")
} 

TRIM() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = 5")
} 
  
MAIN_MENU

# read phone number 
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

EXISTING_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $EXISTING_CUSTOMER ]] 
  then 
  # phone number does not exist
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME 
  
  # insert customer into table
  INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

  # ask for time
  echo -e "\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # SERVICE_ID_NUM=$($PSQL "SELECT service_id FROM services WHERE name = '$SERVICE_NAME'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
else 
  # phone number exists
  NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  CUSTOMER_ID_EXISTING=$($PSQL "SELECT customer_id FROM customers where phone = '$CUSTOMER_PHONE'")
  
  echo -e "\nWhat time would you like your$SERVICE_NAME,$NAME?"
  read SERVICE;
  
  SERVICE_ID_EXISTING=$($PSQL "SELECT service_id FROM services WHERE name = '$SERVICE_NAME'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID_EXISTING, $SERVICE_ID_EXISTING, '$SERVICE')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE,$NAME."
fi
