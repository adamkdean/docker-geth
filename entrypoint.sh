#!/bin/bash

echo "++ initialising ethereum ++++++++"
geth \
  --datadir /data/store/ \
  init genesis.json

echo "++ starting ethereum ++++++++"  
geth \
  --nodiscover \
  --datadir /data/store/ \
  --rpc \
  --rpcaddr 0.0.0.0 \
  --rpcport 8545 \
  --networkid=42