#!/bin/bash

# Initialisation
i=0
# Boucle de 0 à 100
while [ $i -lt 100 ]
do
    i=$(($i+1)) # Increment
    echo $i # Affichage
done
