# Smart Wallet (EIP-4337 Simulation)

This repository contains a simplified smart wallet and Paymaster contract inspired by the principles of [EIP-4337: Account Abstraction](https://eips.ethereum.org/EIPS/eip-4337).

## 📆 Week 5: Lisk Africa Developer's Bootcamp

### Contents
- `SmartWallet.sol`: A basic smart contract wallet supporting owner execution, nonce protection, dummy signature validation, ERC20 gas payments, and batched execution.
- `Paymaster.sol`: A basic Paymaster contract that simulates gas sponsorship.

---

##  What Is Account Abstraction?

Account Abstraction allows smart contracts to act like user accounts. This means wallets are programmable and can support features like:
- Gasless transactions
- Multisig approvals
- Biometric or social logins

Traditional Ethereum uses EOAs (Externally Owned Accounts) which rely on private keys and must pay gas in ETH.

EIP-4337 introduces an off-chain system using `UserOperation` objects, a central `EntryPoint` contract, and optional `Paymaster` sponsors to enable this abstraction.

---

##  How to Use

1. Deploy `SmartWallet` with your address as the owner.
2. Fund the wallet with ETH.
3. Call `execute()` to forward ETH or function calls.
4. Use `batchExecute()` to perform multiple actions in one transaction.
5. Use `payWithToken()` to simulate gas payment using ERC20.
6. Deploy `Paymaster` and call `sponsorGas()` to log gas sponsorship.

---

