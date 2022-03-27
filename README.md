# ERC 20 Implementation

I will try to implement ERC-20 without looking another implementations. This implementation is for only educational purposes. Also i've never read another implementations.

# TO-DO

- ✅ Implement: Function for minting
- ✅ Implement: Optional functions (name, symbol, decimals)
- ✅ Research: According to eip-20 standard when transfer failed MUST return false and also MUST throw an error.Is it possible to return false and throw error in same time?
- ✅ Implement: Throw meaningful error messages. Use require instead of revert if possible.
- ⬜️ Research: What is the best way to set totalSupply?
- ⬜️ Fix: Attack vector on approve/transferFrom methods
- ⬜️ Implement: Write tests for contracts.

# Compile

I am using remix for compiling and testing. You can connect remix to your localhost. For this you need to install first remixd tool. \
`npm install -g @remix-project/remixd`

`remixd -s /your/working/directory --remix-ide https://remix.ethereum.org` \
Then open remix editor and select localhost on workspaces.

# Resources

- https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
- https://www.npmjs.com/package/@remix-project/remixd
- https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/view
