#!/bin/bash
awk -F, '
NR == 1 { next }
{
  name = $1
  email = $2
  id = $3

  if (id == "") {
     print name "does not have an ID"
     next
  }

  if (id % 2 == 0) {
     id_status="even"
  }
  else {
     id_status="odd"
  }

  if (email ~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/) {
    email_status = "has a routable, FQDN email address"
  } else {
    email_status = "does not have a routable, FQDN email address"
  }

  print "The user ID ("id") for : "name" is "id_status" and "email_status" "

}' /home/essam/newfile.txt