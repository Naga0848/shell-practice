#!bin/bash

# In shell scripting we can store the output of command in a different variable

# For example, if we try to print the date in linux machine,  it gives different timestamp at different times when we type date. So, we can store the output of the date command when it is printed.

TIMESTAMP=$(date)
echo "Script executed at: $TIMESTAMP"

# here TIMESTAMP is a variable and we are storing the value of date in this variable

#Storing the sum of two numbers in a variable


NUMBER1=100
NUMBER2=200
SUM=$(($NUMBER1+$NUMBER2))

echo "SUM of $NUMBER1 and $NUMBER2 is: $SUM"

# Here NUMBER1 & NUMBER2 are variables, and we are storing the value in another variable called SUM 






