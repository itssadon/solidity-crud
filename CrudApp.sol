pragma solidity ^0.4.23;

constract CrudApp {

    struct country {
        string name;
        string leader;
        uint256 population;
    }

    country[] public countries;

    uint256 public totalCountries;

    constructor() public {
        totalCountries = 0;
    }
}
