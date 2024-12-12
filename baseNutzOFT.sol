// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFT } from "@layerzerolabs/oft-evm/contracts/OFT.sol";

/// @notice nutzOFT is bridged ERC-20 token that extends the OFTCore contract.
contract nutzOFT is OFT {
    constructor(
        string memory _name,     //  Suggon DeezNutz (Base)
        string memory _symbol,  // NUTZ
        address _lzEndpoint,    // 0x1a44076050125825900e736c501f859c50fE728c
        address _delegate       // 0x004836Ce4d02cFDC0e7864cA3E26eD4bDCd19579
    ) OFT(_name, _symbol, _lzEndpoint, _delegate) Ownable(_delegate) {}
}