pragma solidity ^0.6.0;


import "./MintableERC20.sol";


contract MockMANA is MintableERC20 {

    uint public decimals = 18;
    string public symbol = "MANA";
    string public name = "Decentraland";
}