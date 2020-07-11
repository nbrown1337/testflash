pragma solidity ^0.6.0;

import "../../../node_modules/@openzeppelin/contracts/math/SafeMath.sol";
import "../../../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "../../../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "../../../node_modules/@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "../interfaces/IFlashLoanReceiver.sol";
import "../../interfaces/ILendingPoolAddressesProvider.sol";
import "../../interfaces/INetworkMetadataProvider.sol";

contract FlashLoanReceiverBase is IFlashLoanReceiver {

    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    ILendingPoolAddressesProvider addressesProvider;

    constructor(ILendingPoolAddressesProvider _provider) public {
        addressesProvider = _provider;
    }

    fallback () external payable {
    }

    function transferFundsBackToPoolInternal(address _reserve, uint _amount) internal {

        address payable core = addressesProvider.getLendingPoolCore();

        transferInternal(core,_reserve, _amount);
    }

    function transferInternal(address payable _destination, address _reserve, uint  _amount) internal {
        if(_reserve == INetworkMetadataProvider(addressesProvider.getNetworkMetadataProvider()).getEthereumAddress()) {
            _destination.transfer(_amount);
            return;
        }

        IERC20(_reserve).safeTransfer(_destination, _amount);


    }

    function getBalanceInternal(address _target, address _reserve) internal view returns(uint256) {
        if(_reserve == INetworkMetadataProvider(addressesProvider.getNetworkMetadataProvider()).getEthereumAddress()) {

            return _target.balance;
        }

        return IERC20(_reserve).balanceOf(_target);

    }
}
