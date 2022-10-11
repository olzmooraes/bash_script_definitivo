#! /bin/bash

cd ./pokemon

attack1_pkm1=$(grep "Attack" ./pkm1.txt)
read -a attack_pkm1 <<<"$attack1_pkm1"
attack2_pkm2=$(grep "Attack" ./pkm2.txt)
read -a attack_pkm2 <<<"$attack2_pkm2"

defesa_pkm2="${id2[5]}"
ataque_pkm1="${attack_pkm1[2]}"


 ataque_final_pkm1=$(( $ataque_pkm1 - $defesa_pkm2 ))

 echo $ataque_final_pkm1
