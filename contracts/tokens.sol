// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Link is ERC20 {
    constructor() ERC20("chainlink", "Link") public {
        _mint(msg.sender, 1000)
;    }
}