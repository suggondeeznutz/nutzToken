// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.22;

import { OFTAdapter } from "@layerzerolabs/oft-evm/contracts/OFTAdapter.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

/// @notice OFTAdapter uses a deployed ERC-20 token and safeERC20 to interact with the OFTCore contract. This contract allows NUTZ to traverse into other blockchain networks by lock & mint / burn and release mechanism, preserving 1:1 NUTZ across all chain fully decentralised.
contract nutzOFTAdaptor is OFTAdapter {
    constructor(
        address _token, // 0x50B98713375aE710B7EF1640904523975c1887B8  NUTZ on eth = parent chain
        address _lzEndpoint, // 0x1a44076050125825900e736c501f859c50fE728c    layerzero endpoint
        address _owner // 0x004836Ce4d02cFDC0e7864cA3E26eD4bDCd19579        adaptor admin
    ) OFTAdapter(_token, _lzEndpoint, _owner) Ownable(_owner) {}
}