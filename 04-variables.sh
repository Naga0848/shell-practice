#!bin/bash

#Variables are like containers to hold the value, you can use it whereever you need. And it is a centralized one.

#we can send the values to the variables during runtime also, whhich is called args/arguments



PERSON1=$1   #there should be no space before and after =
PERSON2=$2    #there should be no space before and after =
echo "$PERSON1 :: Hi $PERSON2, Good Morning"
echo "$PERSON2:: Hello $PERSON1, Good Morning, I am doing great, How are you ?"
echo "$PERSON1:: I am fine thankyou, whats up ?"
echo "$PERSON2:: Nothing, just going to Mars now, will you come ?"
echo "$PERSON1:: Sorry, you carry on!! I will come once you come back"
