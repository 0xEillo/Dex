const Dex = artifacts.require("Dex")
const Link = artifacts.require("Link")
const truffleAssert = require("truffle-assertions")

// each contract redeploys a contract
contract.skip("Dex", accounts=> {
    // each "it" is an individial unit test
    it("should only be possible for owner to add tokens", async() => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await truffleAssert.passes(
            dex.addToken(web3.utils.fromUtf8("Link"), link.address, {from: accounts[0]})
        )
        await truffleAssert.reverts(
            dex.addToken(web3.utils.fromUtf8("Link"), link.address, {from: accounts[1]})
        )
    })

    it("should handle deposits correctly", async() => {
        let dex = await Dex.deployed()
        let link = await Link.deployed()
        await link.approve(dex.address, 500)
        await dex.deposit(100, web3.utils.fromUtf8("Link"))
        await truffleAssert.passes(
            dex.addToken(web3.utils.fromUtf8("Link"), link.address, {from: accounts[0]})
        )
        let balance = await dex.balances(accounts[0], web3.utils.fromUtf8("Link"))
        assert.equal(balance.toNumber(), 100)
    })

    it("should handle faulty withdraws correctly", async() => {
        let dex = await Dex.deployed()
        await truffleAssert.reverts(
            dex.withdraw(500, web3.utils.fromUtf8("Link"))
        )
    })

    it("should handle successful withdraws correctly", async() => {
        let dex = await Dex.deployed()
        await truffleAssert.passes(
            dex.withdraw(100, web3.utils.fromUtf8("Link"))
        )
    })
})