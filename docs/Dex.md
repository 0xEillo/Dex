# Dex.sol

View Source: [\contracts\dex.sol](..\contracts\dex.sol)

**↗ Extends: [Wallet](Wallet.md)**

**Dex**

**Enums**
### Side

```js
enum Side {
 BUY,
 SELL
}
```

## Structs
### Order

```js
struct Order {
 uint256 id,
 address trader,
 enum Dex.Side side,
 bytes32 ticker,
 uint256 amount,
 uint256 price,
 uint256 filled
}
```

## Contract Members
**Constants & Variables**

```js
uint256 public nextOrderId;
mapping(bytes32 => mapping(uint256 => struct Dex.Order[])) public orderBook;

```

## Functions

- [getOrderBook(bytes32 ticker, enum Dex.Side side)](#getorderbook)
- [createLimitOrder(enum Dex.Side side, bytes32 ticker, uint256 amount, uint256 price)](#createlimitorder)
- [createMarketOrder(enum Dex.Side side, bytes32 ticker, uint256 amount)](#createmarketorder)

### getOrderBook

```js
function getOrderBook(bytes32 ticker, enum Dex.Side side) public view
returns(struct Dex.Order[])
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| ticker | bytes32 |  | 
| side | enum Dex.Side |  | 

### createLimitOrder

```js
function createLimitOrder(enum Dex.Side side, bytes32 ticker, uint256 amount, uint256 price) public nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| side | enum Dex.Side |  | 
| ticker | bytes32 |  | 
| amount | uint256 |  | 
| price | uint256 |  | 

### createMarketOrder

```js
function createMarketOrder(enum Dex.Side side, bytes32 ticker, uint256 amount) public nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| side | enum Dex.Side |  | 
| ticker | bytes32 |  | 
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
