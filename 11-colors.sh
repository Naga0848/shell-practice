#!bin/bash

# In general we represent success with green color and failure with red color in programming.

# \e[<code>m   >>> is the syntax for the color in shell-scripting

echo -e "\e[31m Hello-World \e[0m"

# \e[0m  denotes no color(white)

echo "Hello NO Colors"