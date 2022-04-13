// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.13;

contract SchoolManagering {
    address owner;

    struct Rating {
        string subject;
        uint rating;

    }

    struct Pupil {
        string firstName;
        string lastName;
        uint numberOfRatings;
        mapping(uint => Rating) ratings;
    }

    mapping(address => Pupil) pupils;

    constructor() {
        owner = msg.sender;
    }

    function addPupil(address _pupilAddress, string memory _firstName, string memory _lastName) public {
        require(msg.sender == owner, "Only administrator of School");
        bytes memory firstNameOfAddress = bytes(pupils[_pupilAddress].firstName);
        require(firstNameOfAddress.length == 0, "This student is already registered");
        pupils[_pupilAddress].firstName = _firstName;
        pupils[_pupilAddress].lastName = _lastName;
    }

}

