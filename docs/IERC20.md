# IERC20.sol

View Source: [@openzeppelin\contracts\token\ERC20\IERC20.sol](..\@openzeppelin\contracts\token\ERC20\IERC20.sol)

**↘ Derived Contracts: [ERC20](ERC20.md), [IERC20Metadata](IERC20Metadata.md)**

**IERC20**

**Events**

```js
event Transfer(address indexed from, address indexed to, uint256  value);
event Approval(address indexed owner, address indexed spender, uint256  value);
```

## Functions

- [totalSupply()](#totalsupply)
- [balanceOf(address account)](#balanceof)
- [transfer(address recipient, uint256 amount)](#transfer)
- [allowance(address owner, address spender)](#allowance)
- [approve(address spender, uint256 amount)](#approve)
- [transferFrom(address sender, address recipient, uint256 amount)](#transferfrom)

### totalSupply

```js
function totalSupply() external view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### balanceOf

```js
function balanceOf(address account) external view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address |  | 

### transfer

```js
function transfer(address recipient, uint256 amount) external nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| recipient | address |  | 
| amount | uint256 |  | 

### allowance

```js
function allowance(address owner, address spender) external view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| owner | address |  | 
| spender | address |  | 

### approve

```js
function approve(address spender, uint256 amount) external nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| spender | address |  | 
| amount | uint256 |  | 

### transferFrom

```js
function transferFrom(address sender, address recipient, uint256 amount) external nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| sender | address |  | 
| recipient | address |  | 
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
