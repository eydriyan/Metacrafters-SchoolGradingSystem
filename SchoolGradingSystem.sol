// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    mapping(address => uint8) public grades;
    address public teacher;

    constructor() {
        teacher = msg.sender;
    }

    // Add or update a student's grade
    function addGrade(address student, uint8 grade) public {
        require(grade <= 100, "Grade must be between 0 and 100");
        require(msg.sender == teacher, "Unauthorized Access!");
        grades[student] = grade;
    }

    // Get a student's grade
    function getGrade(address student) public view returns (uint8) {
        uint8 grade = grades[student];
        require(msg.sender == teacher, "Unauthorized Acess!");
        return grade;
    }

    // Check if a student passed (grade >= 50)
    function didPass(address student) public view returns (bool) {
        uint8 grade = grades[student];
        if (msg.sender != teacher) {
            revert("Unauthorized Access!");
        }
        assert(grade <= 100);
        return grade >= 50;
    }
}
