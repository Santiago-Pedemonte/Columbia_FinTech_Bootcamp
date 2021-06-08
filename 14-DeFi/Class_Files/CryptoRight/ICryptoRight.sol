pragma experimental ABIEncoderV2;
pragma solidity ^0.5.0;

interface ICryptoRight {

    struct IWork {
        address owner;
        string uri;
    }

    event Copyright(uint copyright_id, address owner, string reference_uri);

    event OpenSource(uint copyright_id, string reference_uri);

    event Transfer(uint copyright_id, address new_owner);

    function copyrights(uint copyright_id) external returns(IWork memory);

    function copyrightWork(string calldata reference_uri) external;

    function openSourceWork(string calldata reference_uri) external;

    function renounceCopyrightOwnership(uint copyright_id) external;

    function transferCopyrightOwnership(uint copyright_id, address new_owner) external;
}
