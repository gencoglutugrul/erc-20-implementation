// SPDX-License-Identifier: MIT

pragma solidity >=0.4.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    mapping(address => uint256) private _balance;
    // _spender => (_owner => _value)
    mapping(address => mapping(address => uint256)) _allowence;
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(uint256 __totalSupply, uint8 __decimals, string memory __name, string memory __symbol) {
        _name = __name;
        _symbol = __symbol;
        _decimals = __decimals;
        _totalSupply = __totalSupply;
    }

    function name() external view returns(string memory){
        return _name;
    }

    function symbol() external view returns(string memory){
        return _symbol;
    }

    function decimals() external view returns(uint8){
        return _decimals;
    }

    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner)
        external
        view
        virtual
        override
        returns (uint256)
    {
        return _balance[_owner];
    }

    function transfer(address _to, uint256 _value)
        external
        virtual
        override
        returns (bool)
    {
        require(_value <= _balance[msg.sender], "Error: Insufficient balance");
        _balance[msg.sender] -= _value;
        _balance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external virtual override returns (bool) {
        require(_value <= _allowence[msg.sender][_from], "Error: Insufficient allowence");
        _allowence[msg.sender][_from] -= _value;
        _balance[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        external
        virtual
        override
        returns (bool)
    {
        // ERC20 API: An Attack Vector on Approve/TransferFrom Methods
        // https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/view
        // find solution for that
        require(_value <= _balance[msg.sender], "Error: Insufficient balance");
        _balance[msg.sender] -= _value;
        _allowence[_spender][msg.sender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        external
        view
        virtual
        override
        returns (uint256)
    {
        return _allowence[_spender][_owner];
    }
}
