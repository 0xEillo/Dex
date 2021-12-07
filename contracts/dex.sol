// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.9;
pragma experimental ABIEncoderV2;

import "./wallet.sol";

/**
 * @title Dex
 * @dev Dex contract enables people to trade ETH/tokens
 * by creating limit and market orders
 */
contract Dex is Wallet {

    using SafeMath for uint256;

    uint public nextOrderId = 0;

    mapping(bytes32 => mapping(uint => Order[])) public orderBook;

    enum BuyOrSell {
        BUY,
        SELL
    }

    struct Order {
        uint id;
        address trader;
        BuyOrSell buyOrSell;
        bytes32 ticker;
        uint amount;
        uint price;
        uint filled;
    }

    /**
     * @dev Returns orderbook with desired BuyOrSell and ticker
     * @param ticker Represents the symbol of a token
     * @param buyOrSell Represents if the order is buy/sell    
     */
    function getOrderBook(bytes32 ticker, BuyOrSell buyOrSell) view public returns(Order[] memory){
        return orderBook[ticker][uint(buyOrSell)];
    }

    /**
     * @dev Allows users to create buy/sell limitOrders
     * @param buyOrSell Represents if the order is buy/sell
     * @param ticker represents the symbol of a token
     * @param amount Represents the amount of tokens to buy or sell
     * @param price Represents the price at which to buy/sell tokens
     */
    function createLimitOrder(BuyOrSell buyOrSell, bytes32 ticker, uint amount, uint price) public{
        if(buyOrSell == BuyOrSell.BUY){
            require(balances[msg.sender]["ETH"] >= amount.mul(price));
        }
        if(buyOrSell == BuyOrSell.SELL){
            require(balances[msg.sender][ticker] >= amount);
        }

        Order[] storage orders = orderBook[ticker][uint(buyOrSell)];
        orders.push(
            Order(nextOrderId, msg.sender, buyOrSell, ticker, amount, price, 0)
        );

        //Bubble sort
        uint i = orders.length > 0 ? orders.length - 1 : 0;
        if(buyOrSell == BuyOrSell.BUY){
            while(i > 0){
                if(orders[i - 1].price > orders[i].price) {
                    break;
                }
                Order memory orderToMove = orders[i - 1];
                orders[i - 1] = orders[i];
                orders[i] = orderToMove;
                i--;
            }
        }
        else if(buyOrSell == BuyOrSell.SELL){
            while(i > 0){
                if(orders[i - 1].price < orders[i].price) {
                    break;   
                }
                Order memory orderToMove = orders[i - 1];
                orders[i - 1] = orders[i];
                orders[i] = orderToMove;
                i--;
            }
        }

        nextOrderId++;
    }

    /**
     * @dev Allows users to create buy/sell market orders
     * @param buyOrSell Represents if the order is buy/sell
     * @param ticker represents the symbol of a token
     * @param amount Represents the amount of tokens to buy or sell
     */
    function createMarketOrder(BuyOrSell buyOrSell, bytes32 ticker, uint amount) public{
        if(buyOrSell == BuyOrSell.SELL){
            require(balances[msg.sender][ticker] >= amount, "Insuffient balance");
        }
        
        uint orderBookBuyOrSell;
        if(buyOrSell == BuyOrSell.BUY){
            orderBookBuyOrSell = 1;
        }
        else{
            orderBookBuyOrSell = 0;
        }
        Order[] storage orders = orderBook[ticker][orderBookBuyOrSell];

        uint totalFilled = 0;

        for (uint256 i = 0; i < orders.length && totalFilled < amount; i++) {
            uint leftToFill = amount.sub(totalFilled);
            uint availableToFill = orders[i].amount.sub(orders[i].filled);
            uint filled = 0;
            if(availableToFill > leftToFill){
                filled = leftToFill; //Fill the entire market order
            }
            else{ 
                filled = availableToFill; //Fill as much as is available in order[i]
            }

            totalFilled = totalFilled.add(filled);
            orders[i].filled = orders[i].filled.add(filled);
            uint cost = filled.mul(orders[i].price);

            if(buyOrSell == BuyOrSell.BUY){
                //Verify that the buyer has enough ETH to cover the purchase (require)
                require(balances[msg.sender]["ETH"] >= cost);
                //msg.sender is the buyer
                balances[msg.sender][ticker] = balances[msg.sender][ticker].add(filled);
                balances[msg.sender]["ETH"] = balances[msg.sender]["ETH"].sub(cost);
                
                balances[orders[i].trader][ticker] = balances[orders[i].trader][ticker].sub(filled);
                balances[orders[i].trader]["ETH"] = balances[orders[i].trader]["ETH"].add(cost);
            }
            else if(buyOrSell == BuyOrSell.SELL){
                //Msg.sender is the seller
                balances[msg.sender][ticker] = balances[msg.sender][ticker].sub(filled);
                balances[msg.sender]["ETH"] = balances[msg.sender]["ETH"].add(cost);
                
                balances[orders[i].trader][ticker] = balances[orders[i].trader][ticker].add(filled);
                balances[orders[i].trader]["ETH"] = balances[orders[i].trader]["ETH"].sub(cost);
            }
            
        }
            //Remove 100% filled orders from the orderbook
        while(orders.length > 0 && orders[0].filled == orders[0].amount){
            //Remove the top element in the orders array by overwriting every element
            // with the next element in the order list
            for (uint256 i = 0; i < orders.length - 1; i++) {
                orders[i] = orders[i + 1];
            }
            orders.pop();
        }
        
    }

}