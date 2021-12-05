# Wallet.sol

View Source: [\contracts\wallet.sol](..\contracts\wallet.sol)

**↗ Extends: [Ownable](Ownable.md)**
**↘ Derived Contracts: [Dex](Dex.md)**

**Wallet**

## Structs
### Token

```js
struct Token {
 bytes32 ticker,
 address tokenAddress
}
```

## Contract Members
**Constants & Variables**

```js
mapping(bytes32 => struct Wallet.Token) public tokenMapping;
bytes32[] public tokenList;
mapping(address => mapping(bytes32 => uint256)) public balances;

```

**Events**

```js
event Deposited(uint256  amount, bytes32  ticker);
```

## Modifiers

- [tokenExists](#tokenexists)

### tokenExists

```js
modifier tokenExists(bytes32 ticker) internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| ticker | bytes32 |  | 

## Functions

- [addToken(bytes32 ticker, address tokenAddress)](#addtoken)
- [deposit(uint256 amount, bytes32 ticker)](#deposit)
- [withdraw(uint256 amount, bytes32 ticker)](#withdraw)
- [depositEth()](#depositeth)
- [withdrawEth(uint256 amount)](#withdraweth)

### addToken

```js
function addToken(bytes32 ticker, address tokenAddress) external nonpayable onlyOwner 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| ticker | bytes32 |  | 
| tokenAddress | address |  | 

### deposit

```js
function deposit(uint256 amount, bytes32 ticker) external payable tokenExists 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| amount | uint256 |  | 
| ticker | bytes32 |  | 

### withdraw

```js
function withdraw(uint256 amount, bytes32 ticker) external nonpayable tokenExists 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| amount | uint256 |  | 
| ticker | bytes32 |  | 

### depositEth

```js
function depositEth() external payable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### withdrawEth

```js
function withdrawEth(uint256 amount) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| amount | uint256 |  | 

## Contracts

* [Context](Context.md)
* [Dex](Dex.md)
* [ERC20](ERC20.md)
* [IERC20](IERC20.md)
* [IERC20Metadata](IERC20Metadata.md)
* [Link](Link.md)
* [Ownable](Ownable.md)
* [SafeMath](SafeMath.md)
* [Wallet](Wallet.md)
