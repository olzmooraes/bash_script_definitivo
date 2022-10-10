#! /bin/bash

var=500
var2=5001
#if [[ $var > $var2 ]]; then
    echo "funcionou"
#fi
#if [[ $var <= $var2 ]]; then
    echo "funcionou"
#fi
if [[ $var -lt $var2 ]]; then
    echo "funcionou denovo"
fi
