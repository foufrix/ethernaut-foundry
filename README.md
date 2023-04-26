# Ethernaut solution using Foundry

## Prequesites

1. Install foundry

## Run test

`forge test -vvvv`

Run for a specific file :

`forge test -vvvv --match-path ./test/Level01.t.sol `

## Add env parameters

`cp .env.example .env`

Add wallet information, for better security don't use your main wallet for testing code.

## Make Outsidecall to solve ethernaut

1. Add RPC url to `foundry.toml`
2. Add `PRIVATE_KEY` to `.env`
3. Call possible using : `forge script ./script/Level01.s.sol  --broadcast -vvvv --rpc-url goerli`

## Deploy an Attacker Contract

`forge create --rpc-url goerli --private-key <your_private> src/Level04-Attacker.sol:AttackerLevel04`

## Get the storage of a deployed contract

`cast storage <contractAddress> <slotNumber> --rpc-url goerli`

## Architecture

### Test folder

All the files to deploy & test the exploit locally

### Script folder

All the files to test exploit on chain

# State

| Levels              | locally | on-chain (script)  |
| ------------------- | ------- | ------------------ |
| 00-HelloEthernaut   | ✅      | ✅                 |
| 01-Fallback         | ✅      | ✅                 |
| 02-Fallout          | ✅      | ✅                 |
| 03-CoinFlip         | ✅      | ❌                 |
| 04-Telephone        | ✅      | ✅                 |
| 05-Token            | ❌      | ❌ (logic present) |
| 06-Delegation       | ❌      | ✅                 |
| 07-Force            | ✅      | ✅                 |
| 08-Vault            | ❌      | ✅                 |
| 09-King             | ✅      | ✅                 |
| 10-Reentrancy       | ❌      | ✅                 |
| 11-Elevator         | ✅      | ✅                 |
| 12-Privacy          | ❌      | ✅                 |
| 13-GatekeeperOne    | ❌      | ❌                 |
| 14-GatekeeperTwo    | ❌      | ❌                 |
| 15-NaughtCoin       | ✅      | ✅                 |
| 16-Preservation     | ✅      | ✅                 |
| 17-Recovery         | ❌      | ✅                 |
| 18-MagicNumber      | ❌      | ❌                 |
| 19-AlienCodex       | ❌      | ✅                 |
| 20-Denial           | ✅      | ✅                 |
| 21-Shop             | ❌      | ❌                 |
| 22-Dex              | ✅      | ✅                 |
| 23-DexTwo           | ✅      | ❌                 |
| 24-PuzzleWallet     | ❌      | ✅                 |
| 25-Motorbike        | ❌      | ✅                 |
| 26-DoubleEntryPoint | ❌      | ❌                 |
| 27-GoodSamaritan    | ❌      | ✅                 |
| 28-GateKeeperThree  | ❌      | ❌                 |

_Note: most of levels are solved. I encountered some difficulties to make them all work locally and on-chain, feel free to drop a PR to solve that 🙏_
