// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address recipient;
    address owner;
    uint lastTime;

    constructor(address _recipient) payable {
        recipient = _recipient;
        owner = msg.sender;
        lastTime = block.timestamp;
    }

    function withdraw() external {
        require((block.timestamp - lastTime) >= 52 weeks, "Its not time yet!");
        (bool sent, ) = recipient.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    function ping() external {
        require(msg.sender == owner, "Hey you aren't the owner!");
        lastTime = block.timestamp;
    }
}
