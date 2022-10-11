#! /bin/bash

cd ./pokemon
i=0
j=0

speed1_pkm1=$(grep "Speed" ./pkm1.txt)
read -a speed_pkm1 <<<"$speed1_pkm1"
speed2_pkm2=$(grep "Speed" ./pkm2.txt)
read -a speed_pkm2 <<<"$speed2_pkm2"

attack1_pkm1=$(grep "Attack" ./pkm1.txt)
read -a attack_pkm1 <<<"$attack1_pkm1"
attack2_pkm2=$(grep "Attack" ./pkm2.txt)
read -a attack_pkm2 <<<"$attack2_pkm2"

HP1_pkm1=$(grep "HP" ./pkm1.txt)
read -a HP_pkm1 <<<"$HP1_pkm1"
HP2_pkm2=$(grep "HP" ./pkm2.txt)
read -a HP_pkm2 <<<"$HP2_pkm2"

defesa_pkm1="${id1[5]}"
defesa_pkm2="${id2[5]}"
vida_pkm1="${HP_pkm1[2]}"
vida_pkm2="${HP_pkm2[2]}"
ataque_pkm1="${attack_pkm1[2]}"
ataque_pkm2="${attack_pkm2[2]}"
speed_pkm1="${speed_pkm1[2]}"
speed_pkm2="${speed_pkm2[2]}"

if (( $speed_pkm1 < $speed_pkm2 )); then

    while [[ $vida_pkm1 > 0 && $vida_pkm2 -gt 0 ]]; do

        if (( $vida_pkm2 > 0 )); then

            ataque_final_pkm1=$(($ataque_pkm1 - $defesa_pkm2))
            vida_pkm2=$(($vida_pkm2 - $ataque_final_pkm1))
            j=$(($j + 1))
        fi
        if (( $vida_pkm1 > 0 )); then
            ataque_final_pkm2=$((ataque_pkm2 - $defesa_pkm1))
            vida_pkm1=$((vida_pkm1 - $ataque_final_pkm2))
            i=$(($i + 1))
        fi
        
    done

    if [[ $vida_pkm1 > 0 ]]; then

        echo "O primeiro pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm1"
        echo "Foram necessários $j hits para derrotar o pokemon adversário"

    fi

    if (( $vida_pkm2 > 0 )); then

        echo "O Segundo pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm2"
        echo "Foram necessários $i hits para derrotar o pokemon adversário"

    fi
    
    echo "funcionou"

    else

    echo "funcoonou o segundo"

fi
 