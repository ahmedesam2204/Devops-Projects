#!/bin/bash
echo "1- add a new user"
echo "2- delet an existing user"
echo "3- modify an existing user"
echo "4- exit"
echo "------------------------"
echo "choose the operation"
read operation
case $operation in
     1)
         echo "enter the username to add"
         read name
         echo "enter primarygroup"
         read primary

         if id "$name" &>/dev/null; then
             echo "user $name already exists"
             exit 1
         fi

         useradd -m -s /bin/bash -G $primary $name
         if [ $? -eq 0 ]; then
            echo "User $username has been added successfully!"
         else
            echo "Failed to add user $username!"
         fi
	     ;;
    2)
         echo "enter username you want to delete"
         read name
         if ! id "$name" &>/dev/null; then
             echo "user $name does not exists"
             exit 1
         fi
         userdel -r $name
         ;;
    3)
         echo "enter username you want to edit"
         read name
         if ! id "$name" &>/dev/null; then
             echo "user $name does not exists"
             exit 1
         fi
         echo "add user to new group"
         read group
         usermod -a -G $group $name
         ;;
    4)
         echo "Exiting..."
         exit 0
         ;;
    *)
        echo "Invalid option! Please choose 1, 2, 3, or 4."
        ;;
esac
