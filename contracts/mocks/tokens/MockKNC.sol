pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockKNC is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "KNC";
    string public name = "Kyber Network";
}