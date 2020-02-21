pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockMKR is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "MKR";
    string public name = "Maker";
}