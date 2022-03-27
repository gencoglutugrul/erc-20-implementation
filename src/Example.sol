// SPDX-License-Identifier: MIT

pragma solidity >=0.4.17;

import "./ERC20.sol";

contract Example is ERC20 {
  constructor () ERC20(2, "Example", "XAMP") {
    _mint(msg.sender, 1000);
  }
}