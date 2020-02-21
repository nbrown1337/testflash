pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockTUSD is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "TUSD";
    string public name = "TrueUSD";
}