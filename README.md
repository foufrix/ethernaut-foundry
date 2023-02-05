# Ethernaut solution using Foundry

## Prequesites

1. Install foundry

## Run test

`forge test -vvv`

Run for a specific file :

`forge test -vvv --match-path ./test/Level01.sol `

## Add env parameters

`cp .env.example .env`

Add wallet information, for better security don't use your main wallet for testing code.

## Make Outsidecall to solve ethernaut

1. Add RPC url to `foundry.toml`
2. Add `PRIVATE_KEY` to `.env`
3. Call possible using : `forge script ./script/Level01.sol  --broadcast -vvvv --rpc-url goerli `

## Deploy an Attacker Contract

`forge create --rpc-url goerli --private-key <your_private> src/Level04-Attacker.sol:AttackerLevel04`

## Get the storage of a deployed contract

`cast storage <contractAddress> <slotNumber> --rpc-url goerli`
