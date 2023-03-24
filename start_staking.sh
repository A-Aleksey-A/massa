#!/bin/bash

cd $HOME/massa/massa-client
massa_wallet_address=$(./massa-client --pwd $massa_pass wallet_info | grep Address | awk '{ print $2 }')

start_staking=$(./massa-client --pwd $massa_pass node_start_staking $massa_wallet_address)
echo $start_staking
