#!/bin/bash

function startWireMock() {
   cd /app/
   java -jar wiremock-standalone-2.19.0.jar --verbose --port 8080
}


########### SIGTERM handler ############
function _term() {
   echo "Stopping container."
   echo "SIGTERM received, shutting down wiremock!"
   pkill grunt;
}

########### SIGKILL handler ############
function _kill() {
   echo "SIGKILL received, shutting down wiremock!"
   pkill -9 grunt;
}

############# MAIN ################

# Set SIGTERM handler
trap _term SIGTERM

# Set SIGKILL handler
trap _kill SIGKILL

# Check whether wiremock is already setup
startWireMock;

echo "#####################"
echo "wiremock IS READY TO USE!"
echo "#####################"


childPID=$!
wait $childPID
