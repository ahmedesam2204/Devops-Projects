#!/bin/bash

# File containing the user data
FILE="/mnt/data/New Text Document (2).txt"

# Read the file line by line
while IFS=, read -r name email id
do
  # Skip the header line
  if [ "$name" == "name" ]; then
    continue
  fi
  
  # Check if the id is empty
  if [ -z "$id" ]; then
    echo "User '$name' does not have an ID."
    continue
  fi

  # Trim any leading or trailing whitespace from the id
  id=$(echo "$id" | xargs)

  # Determine if the ID is even or odd
  if [ $((id % 2)) -eq 0 ]; then
    id_status="even"
  else
    id_status="odd"
  fi

  # Check if the email is FQDN
  if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    email_status="has a routable, FQDN email address"
  else
    email_status="does not have a routable, FQDN email address"
  fi

  echo "The user ID ($id) for '$name' is $id_status and $email_status."
done < "$FILE"