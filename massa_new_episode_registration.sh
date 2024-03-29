#!/bin/bash

#Получаем адрес
cd $HOME/massa/massa-client
massa_wallet_address=$(./massa-client --pwd $massa_pass wallet_info | grep Address | awk '{ print $2 }')
#echo $massa_wallet_address

#Проверяем баланс
balance=$(./massa-client --pwd $massa_pass wallet_info | grep "Balance" | awk '{ print $2 }' | sed 's/final=//;s/,//')
int_balance=${balance%%.*}
#echo $int_balance

#Покупаем роллы
if [ $int_balance -ge "500" ]; then
  if [ $(./massa-client --pwd $massa_pass buy_rolls $massa_wallet_address 1 0 | grep "Sent operation IDs:" -eq 1 ]; then
    echo "Rolls successfully bought"
  else
    echo "Unable to buy rolls"
  fi
else
  echo "Insufficient balance"
fi

#Регистрируемся в стейкинге
