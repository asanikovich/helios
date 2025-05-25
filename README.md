# Helios Node docker image

Docker image for **[helios](https://github.com/a16z/helios)** - A fast, secure, and portable multichain light client for Ethereum

Read more about [light clients](https://ethereum.org/en/developers/docs/nodes-and-clients/light-clients/).

## Usage
- Create `.env` file
- Setup `ETH_RPC_URL` (е.g. `https://eth-mainnet.g.alchemy.com/v2/***`)
- `ETH_RPC_URL` must be a supported Ethereum Execution API Provider that provides the eth_getProof endpoint. Infura does not currently support this. We recommend using Alchemy.
- Run `docker-compose up -d`
