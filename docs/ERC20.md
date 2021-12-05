# ERC20.sol

View Source: [@openzeppelin\contracts\token\ERC20\ERC20.sol](..\@openzeppelin\contracts\token\ERC20\ERC20.sol)

**↗ Extends: [Context](Context.md), [IERC20](IERC20.md), [IERC20Metadata](IERC20Metadata.md)**
**↘ Derived Contracts: [Link](Link.md)**

**ERC20**

## Contract Members
**Constants & Variables**

```js
mapping(address => uint256) private _balances;
mapping(address => mapping(address => uint256)) private _allowances;
uint256 private _totalSupply;
string private _name;
string private _symbol;

```

## Functions

- [(string name_, string symbol_)](#)
- [name()](#name)
- [symbol()](#symbol)
- [decimals()](#decimals)
- [totalSupply()](#totalsupply)
- [balanceOf(address account)](#balanceof)
- [transfer(address recipient, uint256 amount)](#transfer)
- [allowance(address owner, address spender)](#allowance)
- [approve(address spender, uint256 amount)](#approve)
- [transferFrom(address sender, address recipient, uint256 amount)](#transferfrom)
- [increaseAllowance(address spender, uint256 addedValue)](#increaseallowance)
- [decreaseAllowance(address spender, uint256 subtractedValue)](#decreaseallowance)
- [_transfer(address sender, address recipient, uint256 amount)](#_transfer)
- [_mint(address account, uint256 amount)](#_mint)
- [_burn(address account, uint256 amount)](#_burn)
- [_approve(address owner, address spender, uint256 amount)](#_approve)
- [_beforeTokenTransfer(address from, address to, uint256 amount)](#_beforetokentransfer)
- [_afterTokenTransfer(address from, address to, uint256 amount)](#_aftertokentransfer)

### 

```js
function (string name_, string symbol_) public nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| name_ | string |  | 
| symbol_ | string |  | 

### name

```js
function name() public view
returns(string)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### symbol

```js
function symbol() public view
returns(string)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### decimals

```js
function decimals() public view
returns(uint8)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### totalSupply

```js
function totalSupply() public view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### balanceOf

```js
function balanceOf(address account) public view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address |  | 

### transfer

```js
function transfer(address recipient, uint256 amount) public nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| recipient | address |  | 
| amount | uint256 |  | 

### allowance

```js
function allowance(address owner, address spender) public view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| owner | address |  | 
| spender | address |  | 

### approve

```js
function approve(address spender, uint256 amount) public nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| spender | address |  | 
| amount | uint256 |  | 

### transferFrom

```js
function transferFrom(address sender, address recipient, uint256 amount) public nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| sender | address |  | 
| recipient | address |  | 
| amount | uint256 |  | 

### increaseAllowance

```js
function increaseAllowance(address spender, uint256 addedValue) public nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| spender | address |  | 
| addedValue | uint256 |  | 

### decreaseAllowance

```js
function decreaseAllowance(address spender, uint256 subtractedValue) public nonpayable
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| spender | address |  | 
| subtractedValue | uint256 |  | 

### _transfer

```js
function _transfer(address sender, address recipient, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| sender | address |  | 
| recipient | address |  | 
| amount | uint256 |  | 

### _mint

```js
function _mint(address account, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address |  | 
| amount | uint256 |  | 

### _burn

```js
function _burn(address account, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address |  | 
| amount | uint256 |  | 

### _approve

```js
function _approve(address owner, address spender, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| owner | address |  | 
| spender | address |  | 
| amount | uint256 |  | 

### _beforeTokenTransfer

```js
function _beforeTokenTransfer(address from, address to, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| from | address |  | 
| to | address |  | 
| amount | uint256 |  | 

### _afterTokenTransfer

```js
function _afterTokenTransfer(address from, address to, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| from | address |  | 
| to | address |  | 
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
