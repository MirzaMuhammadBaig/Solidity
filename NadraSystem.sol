// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.15;
 
contract Naddra{
   
    uint personCount;
 
    struct Person{
        string Name;
        uint Age;
        string Designation;
        address PersonAddress;
    }
 
    mapping(uint => Person) public person;
 
    function AddPerson(string memory name, uint Age, string memory Designation, address PersonAddress) public{
        person[personCount]=Person(name, Age, Designation, PersonAddress);
        personCount++;
    }
 
    function GetPersonRecord(uint _personID) public view returns (Person memory){
        return person[_personID];
    }
 
    function getAllPersons() public view returns(Person[] memory){
       
        Person[] memory personRecord = new Person[](personCount);
 
        for(uint i=0; i<personCount; i++){
            personRecord[i] = person[i];
        }
        return personRecord;
    }
}
