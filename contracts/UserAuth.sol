// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UserAuth {
    struct User {
        string username;
        bytes32 passwordHash;
    }

    mapping(address => User) private users;

    constructor() {
        // Example require statement in constructor
        require(msg.sender != address(0), "Invalid sender address");
        // Initialize other contract variables
    }

    function signup(string memory username, string memory password) public {
        require(bytes(username).length > 0, "Username cannot be empty");
        require(bytes(password).length > 0, "Password cannot be empty");
        require(bytes(users[msg.sender].username).length == 0, "User already exists");

        users[msg.sender] = User(username, keccak256(abi.encodePacked(password)));
    }

    function login(string memory username, string memory password) public view returns (bool) {
        User memory user = users[msg.sender];
        return (keccak256(abi.encodePacked(password)) == user.passwordHash) && (keccak256(abi.encodePacked(username)) == keccak256(abi.encodePacked(user.username)));
    }
}
