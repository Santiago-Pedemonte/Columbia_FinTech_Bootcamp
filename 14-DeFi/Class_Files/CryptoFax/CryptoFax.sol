pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

/**

    ERC721 Token URI JSON Schema

    {
        "title": "Vehicle Metadata",
        "type": "object",
        "properties": {
            "make": {
                "type": "string",
                "description": "Ford"
            },
            "model": {
                "type": "string",
                "description": "Fusion"
            },
            "year": {
                "type": "uint",
                "description": "2014"
            }
        }
    }

**/

contract CryptoFax is ERC721Full {

    constructor() ERC721Full("CryptoFax", "CARS") public { }

    using Counters for Counters.Counter;
    Counters.Counter token_ids;

    struct Car {
        string vin;
        uint accidents;
    }

    // Stores token_id => Car
    // Only permanent data that you would need to use within the smart contract later should be stored on-chain
    mapping(uint => Car) public cars;

    event Accident(uint token_id, string report_uri);

    function registerVehicle(address owner, string memory vin, string memory token_uri) public returns(uint) {
        token_ids.increment();
        uint token_id = token_ids.current();

        _mint(owner, token_id);
        _setTokenURI(token_id, token_uri);

        cars[token_id] = Car(vin, 0);

        return token_id;
    }

    function reportAccident(uint token_id, string memory report_uri) public returns(uint) {
        cars[token_id].accidents += 1;

        // Permanently associates the report_uri with the token_id on-chain via Events for a lower gas-cost than storing directly in the contract's storage.
        emit Accident(token_id, report_uri);

        return cars[token_id].accidents;
    }
}
