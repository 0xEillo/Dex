# Ownable.sol

View Source: [@openzeppelin\contracts\access\Ownable.sol](..\@openzeppelin\contracts\access\Ownable.sol)

**↗ Extends: [Context](Context.md)**
**↘ Derived Contracts: [Wallet](Wallet.md)**

**Ownable**

## Contract Members
**Constants & Variables**

```js
address private _owner;

```

**Events**

```js
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
```

## Modifiers

- [onlyOwner](#onlyowner)

### onlyOwner

```js
modifier onlyOwner() internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

## Functions

- [()](#)
- [owner()](#owner)
- [renounceOwnership()](#renounceownership)
- [transferOwnership(address newOwner)](#transferownership)
- [_setOwner(address newOwner)](#_setowner)

### 

```js
function () internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### owner

```js
function owner() public view
returns(address)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### renounceOwnership

```js
function renounceOwnership() public nonpayable onlyOwner 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### transferOwnership

```js
function transferOwnership(address newOwner) public nonpayable onlyOwner 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| newOwner | address |  | 

### _setOwner

```js
function _setOwner(address newOwner) private nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| newOwner | address |  | 

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
