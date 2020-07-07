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

    function insert(string countryName, string leader, uint256 population) public returns (uint256 totalCountries) {
        country memory newCountry = country(countryName, leader, population);
        countries.push(newCountry);
        totalCountries++;

        emit CountryEvent(countryName, leader, population);
        return totalCountries;
    }
}
