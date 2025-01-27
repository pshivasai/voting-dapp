// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./candidates.sol";


contract Voting is Candidates{
    function voting(string memory _voterRollno, string memory _candidateRollno) public {
        require(keccak256(abi.encodePacked(voterRollno[msg.sender])) == keccak256(abi.encodePacked(_voterRollno)), "Roll number mismatch");
        require(voters[voterIndex[_voterRollno]].voteStatus == 0, "You already voted");
        candidates[candidateIndex[_candidateRollno]].voteCount++;
        voters[voterIndex[_voterRollno]].voteStatus = 1;
    }
}
