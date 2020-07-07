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

    event CountryEvent(string countryName, string leader, uint256 population);
    event LeaderUpdate(string countryName, string leader);
    event CountryDelete(string countryName);
}
