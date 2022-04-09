# ERC 20 Implementation

I will try to implement ERC-20 without looking another implementations. This implementation is for only educational purposes.

# TO-DO

- ✅ Implement: Function for minting
- ✅ Implement: Optional functions (name, symbol, decimals)
- ✅ Research: According to eip-20 standard when transfer failed MUST return false and also MUST throw an error.Is it possible to return false and throw error in same time?
- ✅ Implement: Throw meaningful error messages. Use require instead of revert if possible.
- ✅ Research: What is the best way to set totalSupply?
- ✅ Implement: Write tests for contracts.
- ⬜️ Fix: Attack vector on approve/transferFrom methods

# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

# Resources

- https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
- https://www.npmjs.com/package/@remix-project/remixd
- https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/view
