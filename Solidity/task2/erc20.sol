// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract ERC20 {
    mapping ( address => uint256 ) public   balanceOf;
    mapping (address => mapping (address => uint256)) public   allowance;

    uint256 public  totalSupply;
    uint256 public  decimals = 18;
    string public  name;
    string public  symbol;
    address public owner;
    constructor(string memory _name,  string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
    }

    event Transfer(address indexed  from, address indexed  to, uint256 amount);
    event Approval(address indexed  from, address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owmer can call the function");
        _;
    }

    function transfer(address _to, uint256 _amount) public returns (bool ){
        require(address(0) != _to, "Transfer to the zero address");
        require(balanceOf[msg.sender] > _amount, "transfer amount exceeds balance");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function approve(address _to, uint256 _amount) public  returns (bool) {
        require(_to != address(0), "Approve to the zero address");
        require(balanceOf[msg.sender] > _amount, "Approve amount exceeds balance");
        allowance[msg.sender][_to] += _amount;
        emit Approval(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _amount) public  returns (bool) {
       
        require(address(0) != _to, "Transfer to the zero address");
        require(balanceOf[msg.sender] > _amount, "transfer amount exceeds balance"); 
        allowance[_from][_to] -= _amount;
        balanceOf[_from] -=_amount;
        balanceOf[_to] += _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }

    function mint(address _to, uint256 _amount) external  onlyOwner{
        require(_to != address(0), "Mint to the zero address");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }
 }