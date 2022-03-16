//NoobCoin.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract NoobCoin is ERC20 {

    uint initialSupply = 1000000e18;
    constructor() ERC20("NoobCoin", "NOOB") {
        _mint(msg.sender, initialSupply);
    }

    function buyToken(address receiver) public payable {
        uint256 amount = msg.value;

        uint256 tokenAmount = amount * 1000;
        _mint(receiver, tokenAmount);

        initialSupply += tokenAmount;
    }
}