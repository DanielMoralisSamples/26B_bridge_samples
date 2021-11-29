// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Contract Imports */
import { ERC20 } from "OpenZeppelin/openzeppelin-contracts@4.0.0/contracts/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "OpenZeppelin/openzeppelin-contracts@4.0.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract TokenChild is ERC20, ERC20Burnable {
    
    address gateway;

    constructor (address _gateway) ERC20("ImperialsCreditsChild", "ICR") {
        gateway = _gateway;
    }

    /**
    * @dev Only callable by account with access (gateway role)
    */

    function mint(
        address recipient,
        uint256 amount
        )
        public
        virtual
        onlyGateway
        {
        _mint(recipient, amount);
    }

    /**
    * @dev Only callable by account with access (gateway role)
    * @inheritdoc ERC20Burnable
    */
    function burn(
        uint256 amount
        )
        public
        override(ERC20Burnable)
        virtual
        onlyGateway
        {
        super.burn(amount);
    }

    /**
    * @dev Only callable by account with access (gateway role)
    * @inheritdoc ERC20Burnable
    */
    function burnFrom(
        address account,
        uint256 amount
        )
        public
        override(ERC20Burnable)
        virtual
        onlyGateway
        {
        super.burnFrom(account, amount);
    }

    modifier onlyGateway {
      require(msg.sender == gateway, "only gateway can burn");
      _;
   }




}