// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Paymaster {
    event Sponsored(address user, uint256 gasCost);

    function sponsorGas(address user) external {
        emit Sponsored(user, tx.gasprice * gasleft());
    }

    receive() external payable {}
}