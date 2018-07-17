pragma solidity ^0.4.24;


import "./Admin.sol";


/// @title Whitelist configurations for the TRVL Token contract.
contract Whitelist is Admin {
    mapping(address => bool) public whitelist;


    /// @dev Verifies the user is whitelisted.
    modifier isWhitelisted(address _user) {
        require(whitelist[_user] != false, "User is not whitelisted!");
        _;
    }

    /// @notice Adds a list of addresses to the whitelist.
    /// @dev Requires that the msg.sender is the Owner.
    /// @param _users The list of addresses to add to the whitelist.
    function addAddressesToWhitelist(address[] _users) external onlyAdmin {
        require(_users.length > 0, "Cannot add an empty list to whitelist!");
        for (uint256 i = 0; i < _users.length; ++i) {
            require(_users[i] != address(0));
            whitelist[_users[i]] = true;
        }
    }

    /// @notice Removes a list of addresses to the whitelist.
    /// @dev Requires that the msg.sender is an Owner.
    /// @param _users The list of addresses to remove from the whitelist.
    function removeAddressesFromWhitelist(address[] _users) external onlyAdmin {
        require(_users.length > 0, "Cannot remove an empty list to whitelist!");
        for (uint256 i = 0; i < _users.length; ++i) {
            whitelist[_users[i]] = false;
        }
    }
}
