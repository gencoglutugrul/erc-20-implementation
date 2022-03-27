// SPDX-License-Identifier: MIT

pragma solidity >=0.4.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    mapping(address => uint256) private _balance;
    // _spender => (_owner => _value)
    mapping(address => mapping(address => uint256)) _allowence;
    uint256 private _totalSupply;

    constructor(uint256 __totalSupply) {
        _totalSupply = __totalSupply;
    }

    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner)
        external
        view
        virtual
        override
        returns (uint256 balance)
    {
        return _balance[_owner];
    }

    function transfer(address _to, uint256 _value)
        external
        virtual
        override
        returns (bool success)
    {
        if (_value <= _balance[msg.sender]) {
            _balance[_to] += _value;
            success = true;
            emit Transfer(msg.sender, _to, _value);
        } else {
            // throw error message
            success = false;
            revert();
        }
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external virtual override returns (bool success) {
        if (_value <= _allowence[msg.sender][_from]) {
            _allowence[msg.sender][_from] -= _value;
            _balance[_to] += _value;
            success = true;
            emit Transfer(_from, _to, _value);
        } else {
            // throw error message
            success = false;
            revert();
        }
    }

    function approve(address _spender, uint256 _value)
        external
        virtual
        override
        returns (bool success)
    {
        // ERC20 API: An Attack Vector on Approve/TransferFrom Methods
        // https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/view
        // find solution for that
        if (_value <= _balance[msg.sender]) {
            _balance[msg.sender] -= _value;
            _allowence[_spender][msg.sender] = _value;
            success = true;
            emit Approval(msg.sender, _spender, _value);
        } else {
            // throw error message
            success = false;
            revert();
        }
    }

    function allowance(address _owner, address _spender)
        external
        view
        virtual
        override
        returns (uint256 remaining)
    {
        remaining = _allowence[_spender][_owner];
    }
}
