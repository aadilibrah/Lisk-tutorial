// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Ownable - Base contract to manage ownership
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }
}

/// @title VotingSystem - Inherits from Ownable
contract VotingSystem is Ownable {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    uint private nextCandidateId;
    mapping(uint => Candidate) private candidates;
    mapping(address => bool) private hasVoted;

    /// @notice Add a candidate to the election
    /// @param name The candidate's name
    function addCandidate(string calldata name) external onlyOwner {
        candidates[nextCandidateId] = Candidate(nextCandidateId, name, 0);
        nextCandidateId++;
    }

    /// @notice Vote for a candidate
    /// @param candidateId The ID of the candidate
    function vote(uint candidateId) external {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateId < nextCandidateId, "Invalid candidate");

        candidates[candidateId].voteCount++;
        hasVoted[msg.sender] = true;
    }

    /// @notice Get candidate details
    /// @param candidateId The ID of the candidate
    /// @return name The name of the candidate
    /// @return voteCount Number of votes the candidate has received
    function getCandidate(uint candidateId) external view returns (string memory name, uint voteCount) {
        require(candidateId < nextCandidateId, "Invalid candidate");
        Candidate storage candidate = candidates[candidateId];
        return (candidate.name, candidate.voteCount);
    }

    /// @notice Get total number of candidates
    /// @return Total number of registered candidates
    function getTotalCandidates() external view returns (uint) {
        return nextCandidateId;
    }
}
