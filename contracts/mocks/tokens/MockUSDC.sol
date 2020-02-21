pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockUSDC is MintableERC20 {

    uint public decimals = 6;
    string public symbol = "USDC";
    string public name = "USD Coin";
}