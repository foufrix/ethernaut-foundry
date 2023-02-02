# Ethernaut solution using Foundry

## Prequesites

1. Install foundry

## Run test

`forge test -vvv`

## Make Outsidecall to solve ethernaut

1. Add RPC url to `foundry.toml`
2. Add `PRIVATE_KEY` to `.env`
3. Call possible using : `forge script ./script/00-HelloEthernaut.sol  --broadcast -vvvv --rpc-url goerli `
