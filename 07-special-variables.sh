#!bin/bash

# There are high chances pof asking questions on these special variables

echo "all variables passed in the script: $@"

echo "no of variables passed to the script: $#"

echo "script name: $0"

echo "current directory: $PWD"

echo "user running he script: $USER"

echo "home directory of the user who is running the script: $HOME"

echo "PID of the current script: $$"   #Like Linux, here also every script we run will have the PID

sleep 15 &  #if we run this command the server go into sleep for 15sec and the command will be running in the background as we used &

echo "PID of the latest command which is running in the backgroubd: $!"  