#!/bin/bash

# sample value for your variables
MYVARVALUE="wiremock"

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template=`cat "app_template.yaml" | sed "s/{{ name }}/$MYVARVALUE/g"`

# apply the yml with the substituted value
echo "$template" | kubectl apply -f -
