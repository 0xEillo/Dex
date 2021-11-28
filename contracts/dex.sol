// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.9;
import "./wallet.sol";

contract Dex is Wallet {

    using SafeMath for uint256;

    enum BuyOrSell{BUY, SELL}

    uint orderId = 0;

    struct Order {
        uint id;
        address trader;
        BuyOrSell buyOrSell;
        bytes32 ticker;
        uint amount;
        uint price;
    }

    // Order book point from asset to buy/sell to array of orders
    mapping(bytes32 => mapping(uint => Order[])) public orderBook;

    // To get the order-book you need the asset(ticker) and buy/sell
    function getOrderBook(bytes32 ticker, BuyOrSell buyOrSell ) public view returns(Order[] memory) {
        return orderBook[ticker][uint(buyOrSell)];
    }

    function createLimitOrder(BuyOrSell buyOrSell, bytes32 ticker, uint amount, uint price, {from: this.state.accountm, gas:3000000}) public {

        // check if buy or sell order and if balance is sufficient
        // push orders to to orders list
        // sort the buy and sell lists using bubble sort
        balance = web3.eth.getBalance(someAddress);
        if(buyOrSell == BuyOrSell.BUY) {
            require(balances[msg.sender]["ETH"] >= amount.mul(price));
        }
        else if(buyOrSell == BuyOrSell.SELL) {
            require(balances[msg.sender][ticker] >= amount.mul(price));
        }

        Order[] storage orders = orderBook[ticker][uint(buyOrSell)];
        orders.push(Order(orderId, msg.sender, buyOrSell, ticker, amount, price));

        // [10, 9, 8, 7(pushed order)]
        if(buyOrSell == BuyOrSell.BUY) {
            for(uint i = orders.length - 1; i >= 0; i--) {
                    if (orders[i].price > orders[i-1].price) {
                        // set values
                        Order memory moveUp = orders[i];
                        Order memory moveDown = orders[i + 1];
                        // swap values
                        orders[i] = moveDown;
                        orders[i-1] = moveUp;
                    }
                }
        }
        // [7, 8, 9, 10]
        else if(buyOrSell == BuyOrSell.SELL) {
            for(uint i = orders.length; i <= 0; i--) {
                    if(orders[i].price > orders[i-1].price) {
                        // set values
                        Order memory moveUp = orders[i];
                        Order memory moveDown = orders[i + 1];
                        // swap values
                        orders[i] = moveUp;
                        orders[i-1] = moveDown;
                    }
                }
        }

    
        orderId++;
    }

    function createMarketOrder(BuyOrSell buyOrSell, bytes32 ticker, uint amount) {}
}