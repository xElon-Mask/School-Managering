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

    function addRating(address _pupilAddress, uint _rating, string memory _subject) public {
        require(msg.sender == owner, "Only administrator of School");
        bytes memory firstNameOfAddress = bytes(pupils[_pupilAddress].firstName);
        require(firstNameOfAddress.length > 0, "This student is not registered at our school");
        pupils[_pupilAddress].ratings[pupils[_pupilAddress].numberOfRatings].rating = _rating;
        pupils[_pupilAddress].ratings[pupils[_pupilAddress].numberOfRatings].subject = _subject;
        pupils[_pupilAddress].numberOfRatings++;
    }

    function getRating(address _pupilAddress) public view returns(uint[] memory) {
        require(msg.sender == owner, "Only administrator of School");
        uint numberRatingsThisPupil = pupils[_pupilAddress].numberOfRatings;
        uint[] memory ratings = new uint[](numberRatingsThisPupil);
        for(uint i = 0; i < numberRatingsThisPupil; i++) {
            ratings[i] = pupils[_pupilAddress].ratings[i].rating;
        }
        return ratings;
    }

}

