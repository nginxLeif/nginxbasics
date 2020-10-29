#!/bin/bash

echo 'How old are you?'

read age

if [ $age -gt 20 ]
then
    echo 'You can drink.'
else
    echo 'You are too young to drink.'
fi
