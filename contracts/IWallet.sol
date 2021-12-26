// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "./UserOperation.sol";

interface IWallet {

    /**
     * validate user's signature and nonce
     * must accept calls ONLY from entrypoint
     * @dev MUST validate caller is the entryPoint.
     *      Must validate the signature and nonce
     * @param userOp the operation that is about to be executed.
     * @param requiredPrefund must as at least this amount to the
     *         sender(entryPoint) to be able to make the call.
     *         The excess is left as a deposit in the entrypoint, for future calls.
     *         can be withdrawn anytime using "entryPoint.withdrawTo()"
     * The prefund value can be zero, in case there is a paymaster in the userOp,
     * or if the sender's deposit is large enough.
     */
    function verifyUserOp(UserOperation calldata userOp, uint requiredPrefund) external;
}
