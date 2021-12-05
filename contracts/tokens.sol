// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Contract to use link tokens for tests
 */
contract Link is ERC20 {
    constructor() ERC20("chainlink", "Link") public {
        _mint(msg.sender, 10000)
;    }
}