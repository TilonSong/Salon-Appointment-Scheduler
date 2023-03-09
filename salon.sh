#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n" 

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT_MENU ;;
    2) COLOR_MENU ;;
    3) PERM_MENU ;;
    4) STYLE_MENU ;;
    5) TRIM_MENU ;;
    *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

CUT_MENU() {
  # ask customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not existing customer
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer's details
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  # get customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # update appointment table
  INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
}

COLOR_MENU() {
  # ask customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not existing customer
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer's details
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  # get customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # update appointment table
  INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
}

PERM_MENU() {
  # ask customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not existing customer
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer's details
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
  # get customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # update appointment table
  INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
}

STYLE_MENU() {
  # ask customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not existing customer
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer's details
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your style, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
  # get customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # update appointment table
  INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
}

TRIM_MENU() {
  # ask customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if not existing customer
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get customer's name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer's details
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your trim, $CUSTOMER_NAME?"
  read SERVICE_TIME
  echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  # get customer's ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # update appointment table
  INSERT_APPOINTMENT_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
}

MAIN_MENU
