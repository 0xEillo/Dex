// Tests for limitOrder functionality
// test 1: amount of eth deposited on the dex must be greater than >= the buy order value
// test 2: amount of tokens (token balance) is >= than sell value 
// test 3: first order of the orderbook must be the highest price


const Dex = artifacts.require("Dex")
const Link = artifacts.require("Link")
const truffleAssert = require('truffle-assertions');

contract("Dex", accounts => {
    //The user must have ETH deposited such that deposited eth >= buy order value
    it("should throw an error if ETH balance is too low when creating BUY limit order", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await truffleAssert.reverts(
            dex.createLimitOrder(0, web3.utils.fromUtf8("LINK"), 10, 1)
        )
        dex.depositEth({value: 10})
        await truffleAssert.passes(
            dex.createLimitOrder(0, web3.utils.fromUtf8("LINK"), 10, 1)
        )
    })
    //The user must have enough tokens deposited such that token balance >= sell order amount
    it("should throw an error if token balance is too low when creating SELL limit order", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await truffleAssert.reverts(
            dex.createLimitOrder(1, web3.utils.fromUtf8("LINK"), 10, 1)
        )
        await link.approve(dex.address, 500);
        await dex.deposit(10, web3.utils.fromUtf8("LINK"));
        await truffleAssert.passes(
            dex.createLimitOrder(1, web3.utils.fromUtf8("LINK"), 10, 1)
        )
    })
    //The BUY order book should be ordered on price from highest to lowest starting at index 0
    it("The BUY order book should be ordered on price from highest to lowest starting at index 0", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await link.approve(dex.address, 500);
        await dex.createLimitOrder(0, web3.utils.fromUtf8("LINK"), 1, 300)
        await dex.createLimitOrder(0, web3.utils.fromUtf8("LINK"), 1, 100)
        await dex.createLimitOrder(0, web3.utils.fromUtf8("LINK"), 1, 200)

        let orderbook = await dex.getOrderBook(web3.utils.fromUtf8("LINK"), 0);
        for (let i = 0; i < orderbook.length - 1; i++) {
            const element = array[index];
            assert(orderbook[i] >= orderbook[i+1])
        }
    })
    //The SELL order book should be ordered on price from lowest to highest starting at index 0
    it("The SELL order book should be ordered on price from lowest to highest starting at index 0", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await link.approve(dex.address, 500);
        await dex.createLimitOrder(1, web3.utils.fromUtf8("LINK"), 1, 300)
        await dex.createLimitOrder(1, web3.utils.fromUtf8("LINK"), 1, 100)
        await dex.createLimitOrder(1, web3.utils.fromUtf8("LINK"), 1, 200)

        let orderbook = await dex.getOrderBook(web3.utils.fromUtf8("LINK"), 1);
        for (let i = 0; i < orderbook.length - 1; i++) {
            const element = array[index];
            assert(orderbook[i] <= orderbook[i+1])
        }
    })

    
})

// when creating a sell market order the seller needs to have enough tokens for the trade
// when creating a buy market order, the buyer needs to have enough ETH for the trade
// market orders can be submitted even if the order book is empty
// market orders should be filled until the order book is empty or the market order is 100% filled
// the eth balance of the buyer should decrease with filled amount
// the token balances of the limit order sellers should decrease with the filled amounts
// filled limit orders should be removed from the orderbook

contract("Dex", accounts => {
    //The user must have ETH deposited such that deposited eth >= buy order value
    it("market-order seller must have enough tokens to sell", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await link.approve(dex.address, 500);
        await dex.deposit(100, web3.utils.fromUtf8("LINK"));

        // create a buy order in the order book
        await dex.createLimitOrder(0,  web3.utils.fromUtf8("LINK"), 100, 1)
        // has enough link
        await truffleAssert.passes(
            dex.createMarketOrder(1, web3.utils.fromUtf8("LINK"), 100)
        )
        // does not have enough link
        await truffleAssert.reverts(
            dex.createMarketOrder(1, web3.utils.fromUtf8("LINK"), 200)
        )
    })
    it("maket-order buyer must have enough ETH to buy tokens", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        dex.depositEth({value: 100})
        // create a buy order in the order book
        await dex.createLimitOrder(1,  web3.utils.fromUtf8("LINK"), 100, 1)
        // has enough link
        await truffleAssert.passes(
            dex.createMarketOrder(0, web3.utils.fromUtf8("LINK"), 100)
        )
        // does not have enough link
        await truffleAssert.reverts(
            dex.createMarketOrder(0, web3.utils.fromUtf8("LINK"), 200)
        )
    })
    it("maket-orders can be submitted even if the order book is empty", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        dex.depositEth({value: 100})
        // Makret order is created even though orderbook is empty
        await truffleAssert.passes(
            dex.createMarketOrder(0, web3.utils.fromUtf8("LINK"), 100)
        )
    })
    it("filled limit orders should be removed from the orderbook", async () => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        dex.depositEth({value: 100})
        // create a sell order in the order book
        await dex.createLimitOrder(1,  web3.utils.fromUtf8("LINK"), 100, 1)
        // passes if order book is not empty
        await truffleAssert.passes(
            dex.getOrderBook != []
        )
        // create a buy markek order for the same amount
        dex.createMarketOrder(0, web3.utils.fromUtf8("LINK"), 100)
        
        // passes if order book is empty
        await truffleAssert.passes(
            dex.getOrderBook == []
        )
    })
})