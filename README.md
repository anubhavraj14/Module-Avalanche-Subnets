# DEFI
Welcome everyone, this is a project related to the cloning of the DeFI Kingdom on the Avalanche CLI.

# Description

This Smart Contract is created in Solidity that replicates few of the features of the the original DeFI game including Battling, Trading and Exploring.
The base of the contract is ERC20 that provides the functionality for minting, burning and the transfer of tokens from one address to another.

Moreover, a vault contract is made that acts as in game bank for the players where they can deposit their actual token in the game and also withdraw them.

# Getting Started

Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Now, you will download all the files present in the repository and then add them in your remix IDE.

The very first task is to create a Custom Subnet in you local network and then add that particular network in metamsk wallet to perform all transactions.

# Creating custom subnet

1. Install the Avalanche CLI tool: To get started, you will need to install the Avalanche Command Line Interface (CLI) tool. This tool is used to interact with the Avalanche network from your terminal. You can find installation instructions for the Avalanche CLI in the official documentation.

2. Create a new subnet: Once you have the Avalanche CLI installed, you can create a new subnet by running the command avalanche subnet create mySubnet in your terminal. This will create a new subnet with the name "mySubnet" on your local machine.

3. Select the EVM Subnet option and configure: When creating a new subnet, you will be prompted to select a subnet type. Choose the SubnetEVM option to create an EVM Subnet on your local machine.

4. Deploy the subnet: After selecting the EVM Subnet option, you can deploy the subnet by running the command avalanche subnet deploy mySubnet and selecting to deploy your subnet on your local network. This will deploy your new EVM Subnet on your local machine.

5. View subnet details: Once your EVM Subnet is deployed, the console will display all the details about the subnet you just created. You can use this information to interact with the subnet and start building your smart-contract protocol.

Now, connect to Metamask and choose Injected provider - Metamask in Remix IDE.

# Functioning 

1. ERC20: Minting, Burning , Transfer and approval.
2. Vault: Withdrawl and Deposit.
3. Battle: Register, Battle, GetDetails etc.
4. Trading: Buy, CreateList, GetListing etc. 
5. Exploring:Explore, Register, GetExplorerDetails etc.

# Working

First of all you have to compile and deploy the ERC20 file and then copy the contract address at which it is deployed. Then use that address as parameter to the constructor for Vault contract to be deployed. After that go on deploying the rest of the contracts. Then you can perform all the required functions one after another as pleased.

## Authors

Contributors names and contact info

Akhanda Pal Biswas 
[@Akhanda](https://www.linkedin.com/in/akhanda-pal-biswas-445a88230/)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details





