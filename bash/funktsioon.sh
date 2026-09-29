#!/bin/bash

kontrolli_faili() {
 	if [ ! -f "$1" ]; then
     	echo "Faili ei leitud!"
     	return 1
 	fi

 	echo "Fail on olemas."
 }

return 0	# tegevus õnnestus
return 1	# tekkis probleem
