#!/bin/bash

len="${#1}"

RED="\033[1;31m"
GREEN="\033[1;32m"


if test $len -ge 10 ; then

    echo "$1" | grep -q [0-10]

     if test $? -eq 0 ; then

           echo "$1" | grep -q [A-Z]

                if test $? -eq 0 ; then

                    echo "$1" | grep -q [a-z]

                       if test $? -eq 0 ; then 

                         echo "$1" | grep -q [$,@,#,%]

                           if test $? -eq 0 ; then
                      
                             echo -e "${GREEN}This is an awesome password!"
							
                       
                           else

                             echo -e "${RED}Weak Password, Should include special chars"
                          
                           fi                       
 
                       else

                         echo -e "${RED}Weak Password, Should include a lower case letter"

                       fi
                   else

                     echo -e "${RED}Weak Password, Should include a capital case letter" 

                 fi
          else

       echo -e "${RED}Weak Password, Should include numbers"   

     fi

else

    echo -e "${RED}Weak Password, password length should be minimum 10 hence weak password"

fi