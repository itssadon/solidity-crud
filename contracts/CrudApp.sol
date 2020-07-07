pragma solidity >=0.4.23;

contract CrudApp {

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
    event LeaderUpdated(string countryName, string leader);
    event CountryDelete(string countryName);

    function insert(string memory countryName, string memory leader, uint256 population) public returns(uint256 numOfCountries) {
        country memory newCountry = country(countryName, leader, population);
        countries.push(newCountry);
        numOfCountries++;

        // Emit event
        emit CountryEvent(countryName, leader, population);
        return numOfCountries;
    }

    function updateLeader(string memory countryName, string memory newLeader) public returns(bool success) {
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

    function deleteCountry(string memory countryName) public returns(bool success) {
        require(totalCountries > 0);
        for (uint256 i = 0; i < totalCountries; i++) {
            if (compareStrings(countries[i].name, countryName)) {
                countries[i] = countries[totalCountries - 1]; // pushing last into current arrray index which we gonna delete
                delete countries[totalCountries - 1]; // now deleteing last index
                totalCountries--; // total count decrease
                countries.pop(); // array length decrease

                // Emit event
                emit CountryDelete(countryName);
                return true;
            }
        }
        return false;
    }

    function getCountry(string memory countryName) public view returns(string memory name, string memory leader, uint256 population) {
        for (uint256 i = 0; i < totalCountries; i++) {
            if (compareStrings(countries[i].name, countryName)) {
                // Emit event
                return (countries[i].name, countries[i].leader, countries[i].population);
            }
        }
        revert('country not found');
    }

    function compareStrings(string memory a, string memory b) internal pure returns(bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    function getTotalCountries() public view returns(uint256 length) {
        return countries.length;
    }
}