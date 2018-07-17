pragma solidity ^0.4.24;

/// Gives the owner the ability to transfer ownership of the contract to a new
/// address and it requires the owner of the new address to accept the transfer.
import "openzeppelin-solidity/contracts/ownership/Claimable.sol";

/// @title Admin functionality for TRVLToken.sol contracts.
contract Admin is Claimable{

    mapping(address => bool) public admins;

    /// @dev Verifies the msg.sender is a member of the admins mapping.
    modifier onlyAdmin() {
        require(admins[msg.sender], "msg.sender is not an admin!");
        _;
    }

    /// @notice Adds a list of addresses to the whitelist.
    /// @dev Requires that the msg.sender is the Owner.
    /// @param _admins The list of addresses to add to admins mapping.
    function addAddressesToAdmins(address[] _admins) external onlyOwner {
        require(_admins.length > 0, "Cannot add an empty list to admins!");
        for (uint256 i = 0; i < _admins.length; ++i) {
            require(_admins[i] != address(0));
            admins[_admins[i]] = true;
        }
    }

    /// @notice Removes a list of addresses to the whitelist.
    /// @dev Requires that the msg.sender is an Owner. It is possible for the admins list to be empty, this is a fail safe
    /// in the event the admin accounts are compromised. The owner has the ability to lockout the server access from which
    /// TravelBlock is processing payments.
    /// @param _admins The list of addresses to remove from the admins list.
    function removeAddressesFromAdmins(address[] _admins) external onlyOwner {
        require(_admins.length > 0, "Cannot remove an empty list to admins!");
        for (uint256 i = 0; i < _admins.length; ++i) {
            admins[_admins[i]] = false;
        }
    }
}
