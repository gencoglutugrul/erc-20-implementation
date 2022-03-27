# ERC 20 Implementation

I will try to implement ERC-20 without looking another implementations. This implementation is for only educational purposes. Also i've never read another implementations.

# TO-DO

- Implement: Function for minting
- Implement: Optional functions (name, symbol, decimals)
- Research: What is the best way to set totalSupply?
- Fix: Attack vector on approve/transferFrom methods
- Implement: Throw meaningful error messages. Use require instead of revert if possible.
- Research: According to eip-20 standard when transfer failed MUST return false and also MUST throw an error.Is it possible to return false and throw error in same time?

# Resources

- https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
