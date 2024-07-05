# Metacrafters: School Grading System Project

This Solidity program demonstrates a custom contract for managing a school grading system. It allows a designated teacher to assign and update student grades, retrieve grades, and check if a student has passed. The contract includes ownership control and basic validations.

## Description

The `SchoolGradingSystem` contract allows the teacher to add or update student grades. It also provides functions to retrieve a student's grade and check if a student has passed based on their grade. The contract includes validations to ensure correct and secure operations.

## Functions

### Add or Update Grade

- **Function**: `addGrade(address student, uint8 grade)`
- **Visibility**: `public`
- **Description**: Allows the teacher to add or update a student's grade.
- **Parameters**:
  - `student`: Address of the student.
  - `grade`: Grade of the student (0-100).
- **Requirements**:
  - `grade` must be between 0 and 100.
  - The sender must be the teacher.

### Get Grade

- **Function**: `getGrade(address student)`
- **Visibility**: `public view`
- **Description**: Allows the teacher to retrieve a student's grade.
- **Parameters**:
  - `student`: Address of the student.
- **Returns**: 
  - Grade of the student (0-100).
- **Requirements**:
  - The sender must be the teacher.

### Check Pass Status

- **Function**: `didPass(address student)`
- **Visibility**: `public view`
- **Description**: Allows the teacher to check if a student has passed.
- **Parameters**:
  - `student`: Address of the student.
- **Returns**: 
  - `true` if the student's grade is 50 or above, `false` otherwise.
- **Requirements**:
  - The sender must be the teacher.
  - The grade must be between 0 and 100.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the [Remix IDE website](https://remix.ethereum.org).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a `.sol` extension (e.g., `SchoolGradingSystem.sol`).
4. Copy and paste the provided code into the file.

```solidity
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
        require(msg.sender == teacher, "Unauthorized Access!");
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
```

5. Click on the "Solidity Compiler" tab in the left-hand sidebar.
6. Set the "Compiler" option to "0.8.0" (or another compatible version).
7. Click on the "Compile SchoolGradingSystem.sol" button.

### Deploying and Interacting

1. After compiling, deploy the contract by clicking on the "Deploy & Run Transactions" tab.
2. Select the SchoolGradingSystem contract from the dropdown menu and click "Deploy."
3. Once deployed, interact with the contract by calling functions like addGrade, getGrade, and didPass. Enter parameters and click "transact" to execute.

## Authors

Adrian Oraya

## License

This project is licensed under the MIT License.
