// SPDX-License-Identifier: GPL
pragma solidity 0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.5/contracts/token/ERC20/ERC20.sol";

/// @title Professor Suggon DeezNutz Token
/// @author Professor Suggon DeezNutz @ suggondeeznutz.meme
/// @notice Do you like Suggon DeezNutz? 
/// @dev Based on ERC20 template. All tokens are created at deployment and sent to the distribution contract.
contract nutzToken is ERC20 {
    address public distributionContract;
    address public adminContract;       
    uint256 public constant maxNutz = 69_000_000_000;   // fixed total supply
        
    modifier onlyAdminContract() {
        require(msg.sender == adminContract, "Only admin can call");
        _;
    }

    constructor(  
        string memory _name,
        string memory _symbol,
        address _distributionContract
    ) ERC20(_name, _symbol) {
        require(_distributionContract != address(0), "Distribution contract cannot be zero address");
        distributionContract = _distributionContract;
        adminContract = msg.sender;

        // Mint all tokens to distribution contract on deployment
        _mint(_distributionContract, maxNutz * (10 ** decimals()));
    }

    /// @notice Standard burn function with access control, only the Professor can burn his own Nutz
    /// @dev Only the admin contract can call this function
    /// @param amount The amount of tokens to burn
    function burnNutz(uint256 amount) external onlyAdminContract {
        _burn(msg.sender, amount);
    }
}