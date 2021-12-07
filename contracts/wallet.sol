// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.9;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Wallet
 * @dev Wallet contract enables dex users 
 * to store their cryptocurrencies
 */
contract Wallet is Ownable {
    using SafeMath for uint256;

    // Mapping from ticker to the Token   
    mapping(bytes32 => Token) public tokenMapping;
    
    // Array storing all tickers(list of tokens)
    bytes32[] public tokenList;

    // Mapping from address -> ticker -> amount(quantity of tokens in balance)
    mapping(address=> mapping(bytes32 => uint256)) public balances;

    // Event emited when tokens are deposited
    event Deposited(uint amount, bytes32 ticker);

    // Event emited when tokens are withdrawn from wallet
    event Withdraw(uint amount, bytes32 ticker);

    struct Token {
                bytes32 ticker;
                address tokenAddress;
            }

    modifier tokenExists(bytes32 ticker){
            require(tokenMapping[ticker].tokenAddress != address(0), "token does not exist");
            _;
        }

    /**
     * @dev Allows users to add the capability of 
     * storing a paticular Token on the wallet 
     * @param ticker Represents the symbol(ticker) of the Token
     * @param tokenAddress Represents the address for the Token being added
     */
    function addToken(bytes32 ticker, address tokenAddress) external onlyOwner {
        tokenMapping[ticker] = Token(ticker, tokenAddress);
        tokenList.push(ticker);
    }

    /**
     * @dev Allows users to deposit tokens onto their wallet
     * @param amount Represents the amount of tokens being deposited
     * @param ticker Represents the symbol(ticker) of the token being deposited
     */
    function deposit(uint amount, bytes32 ticker) payable external tokenExists(ticker) {
        emit Deposited(amount, ticker);
        IERC20(tokenMapping[ticker].tokenAddress).transferFrom(msg.sender, address(this), amount);
        balances[msg.sender][ticker] = balances[msg.sender][ticker].add(amount);
    }

    /**
     * @dev Allows users to withraw tokens from wallet 
     * @param amount Represents the amount of tokens being withdrawn
     * @param ticker Represents the symbol(ticker) of the tokens being withdrawn
     */
    function withdraw(uint amount, bytes32 ticker) external tokenExists(ticker) {
        require(balances[msg.sender][ticker] >= amount, "balance not sufficient");
        emit Withdraw(amount, ticker);
        
        balances[msg.sender][ticker] = balances[msg.sender][ticker].sub(amount);
        IERC20(tokenMapping[ticker].tokenAddress).transfer(msg.sender, amount);
    }

    function depositEth() payable external {
        balances[msg.sender][bytes32("ETH")] = balances[msg.sender][bytes32("ETH")].add(msg.value);
    }
    
    function withdrawEth(uint amount) external {
        require(balances[msg.sender][bytes32("ETH")] >= amount,'Insuffient balance'); 
        balances[msg.sender][bytes32("ETH")] = balances[msg.sender][bytes32("ETH")].sub(amount);
        msg.sender.call{value:amount}("");
    }

}