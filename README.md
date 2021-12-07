# DEX

## This project illustrates my first iteration of a Decentralized Exchange (Dex). I am using Truffle and Hardhat as development environments, OpenZeppelin smart contract library, Solidity for my smart contracts and Javascript for my unit tests.


```bash
|   .gitignore
|   hardhat.config.js
|   package-lock.json
|   package.json
|   README.md
|   tree.txt
|   tree2.txt
|   truffle-config.js
|   
+---artifacts
|   +---@openzeppelin
|   |   \---contracts
|   |       +---access
|   |       |   \---Ownable.sol
|   |       |           Ownable.dbg.json
|   |       |           Ownable.json
|   |       |           
|   |       +---token
|   |       |   \---ERC20
|   |       |       \---IERC20.sol
|   |       |               IERC20.dbg.json
|   |       |               IERC20.json
|   |       |               
|   |       \---utils
|   |           +---Context.sol
|   |           |       Context.dbg.json
|   |           |       Context.json
|   |           |       
|   |           \---math
|   |               \---SafeMath.sol
|   |                       SafeMath.dbg.json
|   |                       SafeMath.json
|   |                       
|   +---build-info
|   |       170d939f4ea9ba196bbc8ae70b9b380a.json
|   |       2c3d48abf651aa09a9d7ab5d81663a04.json
|   |       
|   \---contracts
|       \---wallet.sol
|               Wallet.dbg.json
|               Wallet.json
|               
+---build
|   \---contracts
|           Context.json
|           Dex.json
|           ERC20.json
|           IERC20.json
|           IERC20Metadata.json
|           Link.json
|           Ownable.json
|           SafeMath.json
|           Wallet.json
|           
+---cache
|       solidity-files-cache.json
|       
+---contracts
|       dex.sol
|       Migrations.sol
|       tokens.sol
|       wallet.sol
|       
+---docs
|       Context.md
|       Dex.md
|       ERC20.md
|       IERC20.md
|       IERC20Metadata.md
|       Link.md
|       Ownable.md
|       SafeMath.md
|       Wallet.md
|       
+---migrations
|       1_initial_migration.js
|       2_wallet_migration.js
|       3_token_migration.js
|                  
\---test
        .gitkeep
        dextest.js
        market_order_test.js
        wallettest.js
```

### Project Documentation links:

[Context](https://github.com/Oliver-Ryall/dex/blob/master/docs/Context.md)

[Dex](https://github.com/Oliver-Ryall/dex/blob/master/docs/Dex.md)

[ERC20](https://github.com/Oliver-Ryall/dex/blob/master/docs/ERC20.md)

[IERC20](https://github.com/Oliver-Ryall/dex/blob/master/docs/IERC20.md)

[IERC20Metadata](https://github.com/Oliver-Ryall/dex/blob/master/docs/IERC20Metadata.md)

[Link](https://github.com/Oliver-Ryall/dex/blob/master/docs/Link.md)

[Ownable](https://github.com/Oliver-Ryall/dex/blob/master/docs/Ownable.md)

[SafeMath](https://github.com/Oliver-Ryall/dex/blob/master/docs/SafeMath.md)

[Wallet](https://github.com/Oliver-Ryall/dex/blob/master/docs/Wallet.md)
