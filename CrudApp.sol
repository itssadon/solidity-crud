pragma solidity ^ 0.4 .23;

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

    function insert(string countryName, string leader, uint256 population) public returns(uint256 totalCountries) {
        country memory newCountry = country(countryName, leader, population);
        countries.push(newCountry);
        totalCountries++;

        // Emit event
        emit CountryEvent(countryName, leader, population);
        return totalCountries;
    }

    function updateLeader(string countryName, string newLeader) public returns(bool success) {
        // This has a problem we need loop
        for (uint256 i = 0; i < totalCountries; i++) {
            if (compareStrings(countries[i].name, countryName)) {
                countries[i].leader = newLeader;
                emit LeaderUpdated(countryName, newLeader);
                return true;
            }
        }
        return false;
    }
}