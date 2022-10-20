// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Identity {
    string private password = "mmb123";
    string private username = "mirzamuhammadbaig";
    string yourusername;
    string yourpassword;

    function Username(string memory _username) public {
        yourusername = _username;
    }

    function Password(string memory _password) public {
        {
            yourpassword = _password;
        }
    }

    function login() public view returns (string memory) {
        if (
            bytes(yourusername).length == bytes(username).length &&
            keccak256(abi.encodePacked(password)) ==
            keccak256(abi.encodePacked(yourpassword))
        ) {
            return "Successfully LogIn";
        } else {
            return "Wrong credentials Plz Try Again";
        }
    }
}
