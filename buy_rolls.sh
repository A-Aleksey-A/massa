#!/bin/bash

cd $HOME/massa/massa-client
massa_wallet_address=$(./massa-client --pwd $massa_pass wallet_info | grep Address | awk '{ print $2 }')

buy_rolls=$(./massa-client --pwd $massa_pass buy_rolls $massa_wallet_address 1 0)
echo $buy_rolls
