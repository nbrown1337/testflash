pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockZRX is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "ZRX";
    string public name = "0x Coin";
}