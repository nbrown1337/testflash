pragma solidity ^0.6.0;


import "./MintableERC20.sol";



contract MockBAT is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "BAT";
    string public name = "Basic Attention Token";
}