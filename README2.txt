# The Great Ether Heist - Submission

## Self-Destruct Contract Information

### Self-Destruct Contract Address:
0x3a076aC92d7fAa450C9cb3BA5Ea6436FAe1E725b

### Summary:
- This is the contract deployed on Lisk Sepolia .
- The contract uses the `selfdestruct` function to send **0.0005 ether** to the `EtherVault` contract.
- It ensures that the exact amount of Ether (0.0005 ether) is sent to the `EtherVault` contract during its execution.
- Once the Ether is sent, the contract self-destructs.

### How the Contract Works:
1. **Deployment**: The contract is deployed with the address of the `EtherVault` contract.
2. **Triggering Self-Destruct**: The `triggerSelfDestruct()` function is called with the required `0.0005 ether` amount. The contract will self-destruct after sending the Ether to the target `EtherVault` contract.
3. **Ether Transfer**: The contract sends **0.0005 ether** to the `EtherVault` contract when self-destruct is triggered.

### What to Submit:
1. **Self-Destruct Contract Address**:
   - The deployed contract address: `0x3a076aC92d7fAa450C9cb3BA5Ea6436FAe1E725b`
   
2. 
   - whitelisted wallet address: '0x3a076aC92d7fAa450C9cb3BA5Ea6436FAe1E725b'
   

3. **Report**:
   - A brief write-up explaining:
     - Send exactly 0.0005 ether to the EtherVault contract.
     - Use the selfdestruct function to send the funds to the EtherVault and destroy itself in the process.
     - The contract was designed to:

            -Accept ether through its triggerSelfDestruct() function.

            -Ensure that exactly 0.0005 ether was sent to the EtherVault contract.

            -Self-destruct after the ether was sent, as required by the challenge.


---


