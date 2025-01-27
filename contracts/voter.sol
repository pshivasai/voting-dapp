// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


 
contract Voters{
    struct Voter{
        string name;
        string rollno;
        uint8 voteStatus;
    }

    Voter[] public voters;
    mapping (string => uint) voterIndex; // rollno mapping to index
    mapping (address => string) voterRollno;

    function createVoter(string memory _name, string memory _rollno) public{
        require(bytes(voterRollno[msg.sender]).length == 0, "Voter already exists!");
        voters.push(Voter(_name, _rollno,0));
        voterIndex[_rollno] = voters.length - 1;
        voterRollno[msg.sender] = _rollno;
    }

}