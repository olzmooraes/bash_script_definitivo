#! /bin/bash

for ((i = 0; i == 0; i++)); do
    if [[ -e pokemon ]]; then
        rm -r pokemon
    fi
done

read -p "Digite seu pokemon numero 1 " digitado1
read -p "Digite seu pokemon numero 2 " digitado2

while [ $digitado1 = $digitado2 ]; do

    echo "Seus pokemons são iguais, comece denovo!"
    read -p "Digite seu pokemon numero 1 " digitado1
    read -p "Digite seu pokemon numero 2 " digitado2

done

while [ -z $digitado1 ]; do
    read -p "Digite seu pokemon numero 1 " digitado1
done

while [ -z $digitado2 ]; do
    read -p "Digite seu pokemon numero 2 " digitado2
done

pkm1="${digitado1,,}"
pkm2="${digitado2,,}"

mkdir pokemon

if [[ $pkm1 != $pkm2 ]]; then

    if [[ -n $pkm1 ]]; then
        touch pkm1.txt
        mv ./pkm1.txt ./pokemon

        list_pkm1=$(grep "${pkm1^}" ./pkm.txt)
        read -a tipo1 <<<"$list_pkm1"

        tipo1_pkm1=$(grep "${tipo1[2]}" ./pkmAdv.txt)
        read -a fraqueza1_pkm1 <<<"$tipo1_pkm1"

        tipo2_pkm1=$(grep "${tipo1[3]}" ./pkmAdv.txt)
        read -a fraqueza2_pkm1 <<<"$tipo2_pkm1"

        grep "${pkm1^}" ./pkm.txt >>./pokemon/pkm1.txt

        espec_pkm1=$(grep "${pkm1^}" ./pkmStats.txt)
        read -a id1 <<<"$espec_pkm1"

        echo " " >>./pokemon/pkm1.txt
        echo "HP : ${id1[3]}" >>./pokemon/pkm1.txt
        echo "Attack : ${id1[6]}" >>./pokemon/pkm1.txt
        echo "Speed : ${id1[8]}" >>./pokemon/pkm1.txt
        printf "Fraqueza: " >>./pokemon/pkm1.txt

        while read fraqueza_pkm1; do

            if echo "$fraqueza_pkm1" | grep -q "${tipo1[2]}"; then

                read -a fraqueza1_pkm1 <<<"$fraqueza_pkm1"
                if [ ${fraqueza1_pkm1[0]} != ${tipo1[2]} ]; then
                    printf "${fraqueza1_pkm1[0]}, " >>./pokemon/pkm1.txt
                fi
            else
                if [ ${#tipo1[@]} == 4 ]; then
                    if echo "$fraqueza_pkm1" | grep -q "${tipo1[3]}"; then
                        read -a segunda_fraqueza_pkm1 <<<"$fraqueza_pkm1"
                        if [ ${segunda_fraqueza_pkm1[0]} != ${tipo1[3]} ]; then
                            printf "${segunda_fraqueza_pkm1[0]}, " >>./pokemon/pkm1.txt
                        fi
                    fi
                fi

            fi
        done <pkmAdv.txt
    fi

    if [[ -n $pkm2 ]]; then

        touch pkm2.txt
        mv ./pkm2.txt ./pokemon

        list_pkm2=$(grep "${pkm2^}" ./pkm.txt)
        read -a tipo2 <<<"$list_pkm2"

        tipo1_pkm2=$(grep "${tipo2[2]}" ./pkmAdv.txt)
        read -a fraqueza1_pkm2 <<<"$tipo1_pkm2"

        tipo2_pkm2=$(grep "${tipo2[3]}" ./pkmAdv.txt)
        read -a fraqueza2_pkm2 <<<"$tipo2_pkm2"

        grep "${pkm2^}" ./pkm.txt >>./pokemon/pkm2.txt

        espec_pkm1=$(grep "${pkm2^}" ./pkmStats.txt)
        read -a id2 <<<"$espec_pkm1"

        echo " " >>./pokemon/pkm2.txt
        echo "HP : ${id2[3]}" >>./pokemon/pkm2.txt
        echo "Attack : ${id2[6]}" >>./pokemon/pkm2.txt
        echo "Speed : ${id2[8]}" >>./pokemon/pkm2.txt
        printf "fraquezas : " >>./pokemon/pkm2.txt

        while read fraqueza_pkm2; do

            if echo "$fraqueza_pkm2" | grep -q "${tipo2[2]}"; then

                read -a fraqueza2_pkm2 <<<"$fraqueza_pkm2"
                if [ ${fraqueza2_pkm2[0]} != ${tipo2[2]} ]; then
                    printf "${fraqueza2_pkm2[0]}, " >>./pokemon/pkm2.txt
                fi
            else
                if [ ${#tipo2[@]} == 4 ]; then
                    if echo "$fraqueza_pkm2" | grep -q "${tipo2[3]}"; then
                        read -a segunda_fraqueza_pkm2 <<<"$fraqueza_pkm2"
                        if [ ${segunda_fraqueza_pkm2[0]} != ${tipo2[3]} ]; then
                            printf "${segunda_fraqueza_pkm2[0]}, " >>./pokemon/pkm2.txt
                        fi
                    fi
                fi

            fi
        done <pkmAdv.txt
    fi
fi

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

if (($speed_pkm1 > $speed_pkm2)); then

    while (($vida_pkm1 > 0)) && (($vida_pkm2 > 0)); do

        if (($vida_pkm2 > 0)); then
            ataque_final_pkm1=$(($ataque_pkm1 - $defesa_pkm2))
            vida_pkm2=$(($vida_pkm2 - $ataque_final_pkm1))
            j=$(($j + 1))
        fi
        if (($vida_pkm1 > 0)); then
            ataque_final_pkm2=$((ataque_pkm2 - $defesa_pkm1))
            vida_pkm1=$((vida_pkm1 - $ataque_final_pkm2))
            i=$(($i + 1))
        fi

    done

    if (($vida_pkm1 > 0)); then

        echo "O primeiro pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm1"
        echo "Foram necessários $j hits para derrotar o pokemon adversário"

    fi

    if (($vida_pkm2 > 0)); then

        echo "O Segundo pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm2"
        echo "Foram necessários $i hits para derrotar o pokemon adversário"

    fi
    if (($vida_pkm1 == $vida_pkm2)); then
        echo "empate"
    fi

else

    while (($vida_pkm1 > 0)) && (($vida_pkm2 > 0)); do

        if (($vida_pkm1 > 0)); then

            ataque_final_pkm2=$(($ataque_pkm2 - $defesa_pkm1))
            vida_pkm1=$(($vida_pkm1 - $ataque_final_pkm2))
            j=$(($j + 1))
        fi
        if (($vida_pkm2 > 0)); then
            ataque_final_pkm1=$((ataque_pkm1 - $defesa_pkm2))
            vida_pkm2=$((vida_pkm2 - $ataque_final_pkm1))
            i=$(($i + 1))
        fi

    done

    if (($vida_pkm1 > 0)); then

        echo "O primeiro pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm1"
        echo "Foram necessários $j hits para derrotar o pokemon adversário"

    fi

    if (($vida_pkm2 > 0)); then

        echo "O Segundo pokemon escolhido ganhou a batalha"
        echo "Sua vida restante é $vida_pkm2"
        echo "Foram necessários $i hits para derrotar o pokemon adversário"

    fi
    if (($vida_pkm1 == $vida_pkm2)); then
        echo "empate"
    fi

fi
