#!/bin/bash 

FUN_TEMPO () {
#============VARIAVEIS============

TMIN=$(curl -s https://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc | grep "tmin" | awk -F '=' '{print $3}' | awk -F '"' '{print $2}')
TMAX=$(curl -s https://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc | grep "tmax" | awk -F '=' '{print $3}' | awk -F '"' '{print $2}')
CMOMENTO=$(curl -s https://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc | grep "cmomento" | awk -F '=' '{print $3}')
TMOMENTO=$(curl -s https://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc | grep "tmomento" | awk -F '=' '{print $3}' | awk -F '"' '{print $2}')
CHUVAN=$(curl -s https://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc | grep "chuvamm" | awk -F '=' '{print $3}' | awk -F '"' '{print $2}')
CHAVE_CMOMENTO=0
#===========EXECUÇÃo=============
##Verifica a temperatura mínima
echo "A temperatura mínima é de: $TMIN graus"
sleep 1
##Verifica a temperatura máxima
echo "A temperatura mínima é de: $TMAX graus"
sleep 1
##Verifica o clima no momento
if [ "$CMOMENTO" = '"">' ]
then 
        echo "Não temos o clima no momento"
else
        echo "$(echo "$CMOMENTO" | awk -F '"' '{print $2}')"
fi
sleep 1
##verifica a temperatura atual
if [ "$TMOMENTO" -ne "$TMOMENTO" ] 2>/dev/null
then
        if [ "$TMOMENTO" -le "15" ]
        then 
                echo "Coloca um casaco, a temperatura é de: $TMOMENTO graus"
        elif [ $TMOMENTO -gt 15 ] && [ $TMOMENTO -le 21 ]
        then
                echo "Ta fresquinho, a temperatura é de: $TMOMENTO graus"
        elif [ $TMOMENTO -le 45 ]
        then
                echo "Ta quem pra caralho, a temperatura é de: $TMOMENTO graus"
        fi
else
        echo "Não temos a temperatura no momento"
fi
sleep 1
##Verifica a probabilidade de chuva
echo "A probabilidade de chuva é de: $CHUVAN %"
}
FUN_TEMPO
