// SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.7.0 <0.9.0;
 
contract array
{
 
    address public owner;
    string[] public StudentRecord;
 
    constructor()
    {
        owner=msg.sender;
    }

    modifier onlyme () {
        require(msg.sender==owner, "You are not the owner");
        _;
    }

    function setStudentRecords(string memory Name, string memory Address, string memory Phone_Num, string memory Roll_Num, string memory DOB, string memory Sem, string memory CGPA, string memory Uni_Name) public
        {
            StudentRecord.push(Name);
            StudentRecord.push(Address);
            StudentRecord.push(Phone_Num);
            StudentRecord.push(Roll_Num);
            StudentRecord.push(DOB);
            StudentRecord.push(Sem);
            StudentRecord.push(CGPA);
            StudentRecord.push(Uni_Name);       
    }
 
    function getStudentRecord() public view returns (string[] memory){
        string[] memory getStudentrecord = new string[](26);
        uint count;
        for(uint i=count; i<StudentRecord.length; i++)
        {
            count++;
        }
        return StudentRecord;
    }
}

