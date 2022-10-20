// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ArrayPop {
    string[][] names;
    string[] boys_name = ["Mirza", "Muhammed", "Baig"];
    string[] girls_name = ["Yusra", "Urooj", "Afiya"];

    function addArray() external {
        names.push(boys_name);
        names.push(girls_name);
    }

    function getArray() public view returns (string[][] memory) {
        return names;
    }

    string[] public testarray = [
        "Mirza",
        "Fatima",
        "Khadija",
        "Muhammad",
        "Abdullah",
        "Haider",
        "Yusra"
    ];

    function PoptheElementfromArray(uint _name) public {
        for (uint i = _name; i < testarray.length - 1; i++) {
            testarray[i] = testarray[i + 1];
        }
        testarray.pop();
    }

    function getLength() public view returns (uint) {
        return testarray.length;
    }
}
