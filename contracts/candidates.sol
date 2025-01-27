// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./voter.sol";

contract Candidates is Voters{
    struct Candidate{
        string name;
        string rollno;
        //add variable that defines which poll the candidate is
        uint voteCount;
    }

    Candidate[] public candidates;// alter we are using same data as voters

    mapping (string => uint) candidateIndex; // candidate rollno mapping to his index
    mapping (address =>string) candidateRollno;


    function createCandidate(string memory _name, string memory _rollno) public{
        require(bytes(candidateRollno[msg.sender]).length == 0, "Candidate already exists!");
        require(keccak256(abi.encodePacked(voterRollno[msg.sender])) == keccak256(abi.encodePacked(_rollno)), "make sure to enter your voter details");
        candidates.push(Candidate(_name, _rollno, 0));
        candidateIndex[_rollno] = candidates.length - 1;
        candidateRollno[msg.sender] = _rollno;
    }


}