// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Identity {
    struct User {
        string name;
        string email;
        bool exists;
    }

    mapping(address => User) private users;

    function createUser(string memory _name, string memory _email) public {
        require(!users[msg.sender].exists, "User already exists");
        users[msg.sender] = User(_name, _email, true);
    }

    function getUser(address _user) public view returns (string memory, string memory) {
        require(users[_user].exists, "User does not exist");
        return (users[_user].name, users[_user].email);
    }
}
