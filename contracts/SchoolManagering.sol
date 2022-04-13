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

}

