pragma solidity ^0.6.0;


import "./MintableERC20.sol";



contract MockLEND is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "LEND";
    string public name = "LEND";
}