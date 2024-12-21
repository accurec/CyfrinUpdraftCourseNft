// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract MoodNftIntegrationTest is Test {
    address public constant USER = address(1);
    string public constant SAD_SVG_URI =
        "data:application/json;base64,eyJuYW1lIjogIk1vb2QgTmZ0IiwgImRlc2NyaXB0aW9uIjogIkFuIE5GVCB0aGF0IHJlZmxlY3RzIHRoZSBvd25lcnMgbW9vZC4iLCAiYXR0cmlidXRlcyI6IFt7InRyYWl0X3R5cGUiOiAibW9vZGluZXNzIiwgInZhbHVlIjogMTAwfV0sICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBEOTRiV3dnZG1WeWMybHZiajBpTVM0d0lpQnpkR0Z1WkdGc2IyNWxQU0p1YnlJL1BqeHpkbWNnZDJsa2RHZzlJakV3TWpSd2VDSWdhR1ZwWjJoMFBTSXhNREkwY0hnaUlIWnBaWGRDYjNnOUlqQWdNQ0F4TURJMElERXdNalFpSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUkrUEhCaGRHZ2dabWxzYkQwaUl6TXpNeUlnWkQwaVRUVXhNaUEyTkVNeU5qUXVOaUEyTkNBMk5DQXlOalF1TmlBMk5DQTFNVEp6TWpBd0xqWWdORFE0SURRME9DQTBORGdnTkRRNExUSXdNQzQySURRME9DMDBORGhUTnpVNUxqUWdOalFnTlRFeUlEWTBlbTB3SURneU1HTXRNakExTGpRZ01DMHpOekl0TVRZMkxqWXRNemN5TFRNM01uTXhOall1Tmkwek56SWdNemN5TFRNM01pQXpOeklnTVRZMkxqWWdNemN5SURNM01pMHhOall1TmlBek56SXRNemN5SURNM01ub2lMejQ4Y0dGMGFDQm1hV3hzUFNJalJUWkZOa1UySWlCa1BTSk5OVEV5SURFME1HTXRNakExTGpRZ01DMHpOeklnTVRZMkxqWXRNemN5SURNM01uTXhOall1TmlBek56SWdNemN5SURNM01pQXpOekl0TVRZMkxqWWdNemN5TFRNM01pMHhOall1Tmkwek56SXRNemN5TFRNM01ucE5Namc0SURReU1XRTBPQzR3TVNBME9DNHdNU0F3SURBZ01TQTVOaUF3SURRNExqQXhJRFE0TGpBeElEQWdNQ0F4TFRrMklEQjZiVE0zTmlBeU56Sm9MVFE0TGpGakxUUXVNaUF3TFRjdU9DMHpMakl0T0M0eExUY3VORU0yTURRZ05qTTJMakVnTlRZeUxqVWdOVGszSURVeE1pQTFPVGR6TFRreUxqRWdNemt1TVMwNU5TNDRJRGc0TGpaakxTNHpJRFF1TWkwekxqa2dOeTQwTFRndU1TQTNMalJJTXpZd1lUZ2dPQ0F3SURBZ01TMDRMVGd1TkdNMExqUXRPRFF1TXlBM05DNDFMVEUxTVM0MklERTJNQzB4TlRFdU5uTXhOVFV1TmlBMk55NHpJREUyTUNBeE5URXVObUU0SURnZ01DQXdJREV0T0NBNExqUjZiVEkwTFRJeU5HRTBPQzR3TVNBME9DNHdNU0F3SURBZ01TQXdMVGsySURRNExqQXhJRFE0TGpBeElEQWdNQ0F4SURBZ09UWjZJaTgrUEhCaGRHZ2dabWxzYkQwaUl6TXpNeUlnWkQwaVRUSTRPQ0EwTWpGaE5EZ2dORGdnTUNBeElEQWdPVFlnTUNBME9DQTBPQ0F3SURFZ01DMDVOaUF3ZW0weU1qUWdNVEV5WXkwNE5TNDFJREF0TVRVMUxqWWdOamN1TXkweE5qQWdNVFV4TGpaaE9DQTRJREFnTUNBd0lEZ2dPQzQwYURRNExqRmpOQzR5SURBZ055NDRMVE11TWlBNExqRXROeTQwSURNdU55MDBPUzQxSURRMUxqTXRPRGd1TmlBNU5TNDRMVGc0TGpaek9USWdNemt1TVNBNU5TNDRJRGc0TGpaakxqTWdOQzR5SURNdU9TQTNMalFnT0M0eElEY3VORWcyTmpSaE9DQTRJREFnTUNBd0lEZ3RPQzQwUXpZMk55NDJJRFl3TUM0eklEVTVOeTQxSURVek15QTFNVElnTlRNemVtMHhNamd0TVRFeVlUUTRJRFE0SURBZ01TQXdJRGsySURBZ05EZ2dORGdnTUNBeElEQXRPVFlnTUhvaUx6NDhMM04yWno0PSJ9";

    DeployMoodNft deployer;
    MoodNft moodNft;

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToSadWorksForMood() public {
        vm.prank(USER);
        moodNft.mintNft();

        vm.prank(USER);
        moodNft.flipMood(0);

        assert(moodNft.getMoodForToken(0) == MoodNft.Mood.SAD);
    }

    function testFlipTokenToSadWorksForURI() public {
        vm.prank(USER);
        moodNft.mintNft();

        vm.prank(USER);
        moodNft.flipMood(0);
        assert(keccak256(abi.encodePacked(moodNft.tokenURI(0))) == keccak256(abi.encodePacked(SAD_SVG_URI)));
    }
}
