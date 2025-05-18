// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

contract SmartWallet {
    address public owner;
    uint256 public nonce;

    event Executed(address to, uint256 value, bytes data);
    event UserValidated(address user, uint256 nonce);
    event BatchExecuted(uint256 count);

    constructor(address _owner) {
        owner = _owner;
        nonce = 0;
    }

    function execute(address to, uint256 value, bytes calldata data) external {
        require(msg.sender == owner, "Not the owner");
        (bool success, ) = to.call{value: value}(data);
        require(success, "Execution failed");
        emit Executed(to, value, data);
        nonce++;
    }

    function validateUserOp(address sender, uint256 _nonce, bytes calldata signature) external view returns (bool) {
        return (sender == owner && _nonce == nonce);
    }

    // Batch multiple contract calls in a single transaction
    function batchExecute(address[] calldata targets, uint256[] calldata values, bytes[] calldata datas) external {
        require(msg.sender == owner, "Not the owner");
        require(targets.length == values.length && values.length == datas.length, "Mismatched input lengths");

        for (uint256 i = 0; i < targets.length; i++) {
            (bool success, ) = targets[i].call{value: values[i]}(datas[i]);
            require(success, "Batch call failed");
        }

        nonce++;
        emit BatchExecuted(targets.length);
    }

    // Pay gas with ERC20 tokens instead of ETH
    function payWithToken(IERC20 token, address sponsor, uint256 amount) external {
        require(msg.sender == owner, "Only owner can pay gas");
        bool success = token.transferFrom(owner, sponsor, amount);
        require(success, "Token payment failed");
    }

    receive() external payable {}
}
