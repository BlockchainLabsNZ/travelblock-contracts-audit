# Gas Consumption Report

```
  Contract: StandardToken
    balanceOf
      when the requested account has no tokens
        ✓ returns zero
      when the requested account has some tokens
        ✓ returns the total amount of tokens
    transfer
      when the recipient is not the zero address
        when the sender does not have enough balance
          ✓ reverts (25008 gas)
        when the sender has enough balance
          ✓ transfers the requested amount (37881 gas)
          ✓ emits a transfer event (37881 gas)
      when the recipient is the zero address
        ✓ reverts (22831 gas)

  Contract: CanReclaimToken - TravelBlock
    ✓ should allow owner to reclaim tokens (26055 gas)
    ✓ should allow only owner to reclaim tokens (23260 gas)

  Contract: Claimable - TravelBlock
    ✓ should have an owner
    ✓ changes pendingOwner after transfer (44278 gas)
    ✓ should prevent to claimOwnership from no pendingOwner (21941 gas)
    ✓ should prevent non-owners from transfering (24005 gas)
    ✓ loses owner after renouncement (14371 gas)
    after initiating a transfer
      ✓ changes allow pending owner to claim ownership (19732 gas)

  Contract: HasNoTokens - TravelBlock
    ✓ should not accept ERC223 tokens (40432 gas)
    ✓ should allow owner to reclaim tokens (26099 gas)
    ✓ should allow only owner to reclaim tokens (23260 gas)

  Contract: PausableToken - TravelBlock
    pause
      when the sender is the token owner
        when the token is unpaused
          ✓ pauses the token (28549 gas)
          ✓ emits a Pause event (28549 gas)
        when the token is paused
          ✓ reverts (22451 gas)
      when the sender is not the token owner
        ✓ reverts (22139 gas)
    unpause
      when the sender is the token owner
        when the token is paused
          ✓ unpauses the token (28304 gas)
          ✓ emits an Unpause event (28304 gas)
        when the token is unpaused
          ✓ reverts (22206 gas)
      when the sender is not the token owner
        ✓ reverts (21897 gas)
    pausable token
      paused
        ✓ is not paused by default
        ✓ is paused after being paused (28549 gas)
        ✓ is not paused after being paused and then unpaused (56853 gas)
      transfer
        ✓ allows to transfer when unpaused (37881 gas)
        ✓ allows to transfer when paused and then unpaused (94734 gas)
        ✓ reverts when trying to transfer when paused (52592 gas)
      approve
        ✓ allows to approve when unpaused (45607 gas)
        ✓ allows to transfer when paused and then unpaused (102460 gas)
        ✓ reverts when trying to transfer when paused (51998 gas)
      transfer from
        ✓ allows to transfer from when unpaused (59421 gas)
        ✓ allows to transfer when paused and then unpaused (116274 gas)
        ✓ reverts when trying to transfer from when paused (53549 gas)
      decrease approval
        ✓ allows to decrease approval when unpaused (31814 gas)
        ✓ allows to decrease approval when paused and then unpaused (88667 gas)
        ✓ reverts when trying to transfer when paused (52306 gas)
      increase approval
        ✓ allows to increase approval when unpaused (32178 gas)
        ✓ allows to increase approval when paused and then unpaused (89031 gas)
        ✓ reverts when trying to increase approval when paused (52702 gas)

  Contract: SafeERC20
    ✓ should throw on failed transfer (23855 gas)
    ✓ should throw on failed transferFrom (23821 gas)
    ✓ should throw on failed approve (23745 gas)
    ✓ should not throw on succeeding transfer (23830 gas)
    ✓ should not throw on succeeding transferFrom (23952 gas)
    ✓ should not throw on succeeding approve (23808 gas)

  Contract: SafeMath
    add
      ✓ adds correctly
      ✓ throws an error on addition overflow
    sub
      ✓ subtracts correctly
      ✓ throws an error if subtraction result would be negative
    mul
      ✓ multiplies correctly
      ✓ handles a zero product correctly
      ✓ throws an error on multiplication overflow
    div
      ✓ divides correctly
      ✓ throws an error on zero division

  Contract: StandardToken
    transfer from
      when the recipient is not the zero address
        when the spender has enough approved balance
          when the owner has enough balance
            ✓ transfers the requested amount (29711 gas)
            ✓ decreases the spender allowance (29711 gas)
            ✓ emits a transfer event (29711 gas)
          when the owner does not have enough balance
            ✓ reverts (25393 gas)
        when the spender does not have enough approved balance
          when the owner has enough balance
            ✓ reverts (25804 gas)
          when the owner does not have enough balance
            ✓ reverts (25393 gas)
      when the recipient is the zero address
        ✓ reverts (23791 gas)
    decrease approval
      when the spender is not the zero address
        when the sender has enough balance
          ✓ emits an approval event (31723 gas)
          when there was no approved amount before
            ✓ keeps the allowance to zero (31723 gas)
          when the spender had an approved amount
            ✓ decreases the spender allowance subtracting the requested amount (31814 gas)
        when the sender does not have enough balance
          ✓ emits an approval event (31723 gas)
          when there was no approved amount before
            ✓ keeps the allowance to zero (31723 gas)
          when the spender had an approved amount
            ✓ decreases the spender allowance subtracting the requested amount (31814 gas)
      when the spender is the zero address
        ✓ decreases the requested amount (30443 gas)
        ✓ emits an approval event (30443 gas)
    increase approval
      when the spender is not the zero address
        when the sender has enough balance
          ✓ emits an approval event (47178 gas)
          when there was no approved amount before
            ✓ approves the requested amount (47178 gas)
          when the spender had an approved amount
            ✓ increases the spender allowance adding the requested amount (32178 gas)
        when the sender does not have enough balance
          ✓ emits an approval event (47178 gas)
          when there was no approved amount before
            ✓ approves the requested amount (47178 gas)
          when the spender had an approved amount
            ✓ increases the spender allowance adding the requested amount (32178 gas)
      when the spender is the zero address
        ✓ approves the requested amount (45898 gas)
        ✓ emits an approval event (45898 gas)

  Contract: Create Travel Token Contract - TravelBlock
    Contract contains the correct amount of currently minted tokens
      ✓ Whitelist values are empty
      ✓ Reverts when add addresses to whitelist is called from a BadGuy (24848 gas)
      ✓ Reverts when whitelisted values are removed by a BadGuy (28434 gas)
      ✓ Allows Owner to call an adminOnly function, even if they are not explicitly on the admins list (80638 gas)
      ✓ Reverts when address(0) is added to whitelist (23519 gas)
      ✓ Reverts when address(0) is added to admins (23232 gas)
      ✓ Reverts when empty list is added to admins (22886 gas)
      ✓ Reverts when empty list is removed to admins (22776 gas)
      ✓ Adding admins who are already on admins, will not emit an event (24798 gas)
      ✓ Adding whitelisters who are already on whitelist, will not emit an event (25085 gas)
      ✓ Removing whitelisters who are not on whitelist, will not emit an event (24400 gas)
      ✓ Removing admins who are not admins already, will not emit an event (24641 gas)
      ✓ Values are removed by owner from whitelist (27885 gas)
      ✓ Values are removed by owner from admins (21720 gas)
      ✓ Tries to update a reward index that doesntexist (87568 gas)
      ✓ Reverts when a BadGuy tries to update percentage indexes (110490 gas)
      ✓ Updates an index value that exists when Owner calls it (79564 gas)
      ✓ Reverts when we try to add a 100% + 1 reward value (23429 gas)
      ✓ Add a 100% reward value (65186 gas)

  Contract: Create Travel Token Contract with default values -
    Contract is initialized
      user is removed from whitelist and cant process payments
        ✓ Reverts when an empty list is passed to removeAddressFromWhitelist function (22535 gas)
        ✓ Reverts when an empty list is passed to addAddressToWhitelist function (23173 gas)
        ✓ User is removed from the whitelist (15836 gas)
        ✓ Reverts when the users who was removed tries to process a payment (39534 gas)
      User calls a paymentRegularTokens method
        ✓ Verifies token balances before we make alterations
        ✓ Reverts with zero amount (22310 gas)
        ✓ Process payments (168956 gas)
        ✓ Reverts when the user tries to process payment that is more than they have (23344 gas)
        ✓ Reverts when non whitelisted users tries to process a payment (23344 gas)
        ✓ Check balances are updated accordingly (168956 gas)
      User calls a paymentRewardTokens method
        ✓ Reverts when non whitelisted user tries to process a payment (22583 gas)
        ✓ Make rewards payment (88638 gas)
        ✓ Reverts when user is out of reward tokens (59402 gas)
        ✓ check values are updated properly (110457 gas)
      User calls a paymentMixed method
        ✓ Reverts when non whitelisted user tries to process a payment (23303 gas)
        ✓ Make rewards payment - check values are updated properly (199674 gas)
      User calls a paymentRegularTokensPriority method
        ✓ Check values updated
        ✓ Reverts when non whitelisted user tries to process a payment (22826 gas)
        ✓ Reverts because user does not have enough tokens (23022 gas)
        ✓ Process Payments - Check Values (200204 gas)
      User calls a paymentRewardTokensPriority method
        ✓ Check values updated
        ✓ Reverts when non whitelisted user tries to process a payment (23987 gas)
        ✓ Reverts because user does not have enough tokens (53924 gas)
        ✓ Make rewards payment - check values stored (274947 gas)
      Owner converts tokens to user
        ✓ Check values updated (52869 gas)
        ✓ Reverts when trying to convert tokens for a non-whitelisted user (25326 gas)
        ✓ Reverts when owner doesnt have enough tokens to convert (25611 gas)

·-------------------------------------------------------------------------------------|----------------------------·
|                                         Gas                                         ·  Block limit: 6721975 gas  │
······················································|·······························|·····························
|  Methods                                            ·          21 gwei/gas          ·       480.14 usd/eth       │
····················|·································|·········|·········|···········|··············|··············
|  Contract         ·  Method                         ·  Min    ·  Max    ·  Avg      ·  # calls     ·  usd (avg)  │
····················|·································|·········|·········|···········|··············|··············
|  ERC223TokenMock  ·  transferERC223                 ·      -  ·      -  ·        -  ·           0  ·          -  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doFailingApprove               ·      -  ·      -  ·        -  ·           0  ·          -  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doFailingTransfer              ·      -  ·      -  ·        -  ·           0  ·          -  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doFailingTransferFrom          ·      -  ·      -  ·        -  ·           0  ·          -  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doSucceedingApprove            ·      -  ·      -  ·    23808  ·           1  ·       0.24  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doSucceedingTransfer           ·      -  ·      -  ·    23830  ·           1  ·       0.24  │
····················|·································|·········|·········|···········|··············|··············
|  SafeERC20Helper  ·  doSucceedingTransferFrom       ·      -  ·      -  ·    23952  ·           1  ·       0.24  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  addRewardPercentage            ·  64802  ·  65186  ·    64879  ·           5  ·       0.65  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  approve                        ·      -  ·      -  ·    45607  ·           2  ·       0.46  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  convertRegularToRewardTokens   ·      -  ·      -  ·    52869  ·           1  ·       0.53  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  decreaseApproval               ·  30443  ·  31814  ·    31503  ·          10  ·       0.32  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  increaseApproval               ·  32178  ·  47178  ·    40922  ·          10  ·       0.41  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  pause                          ·      -  ·      -  ·    28549  ·          14  ·       0.29  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  paymentMixed                   ·  61558  ·  76558  ·    66558  ·           3  ·       0.67  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  paymentRegularTokens           ·  46276  ·  61340  ·    54884  ·           7  ·       0.55  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  paymentRegularTokensPriority   ·  46243  ·  61243  ·    50051  ·           4  ·       0.50  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  paymentRewardTokens            ·  21819  ·  51819  ·    39319  ·           6  ·       0.40  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  paymentRewardTokensPriority    ·  37658  ·  61837  ·    47453  ·           4  ·       0.48  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  reclaimToken                   ·  26055  ·  26099  ·    26077  ·           2  ·       0.26  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  tokenFallback                  ·      -  ·      -  ·        -  ·           0  ·          -  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  transfer                       ·      -  ·      -  ·    37881  ·           4  ·       0.38  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  transferFrom                   ·  29711  ·  59421  ·    41595  ·           5  ·       0.42  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  unpause                        ·      -  ·      -  ·    28304  ·           8  ·       0.29  │
····················|·································|·········|·········|···········|··············|··············
|  TRVLToken        ·  updateRewardPercentageByIndex  ·      -  ·      -  ·    14762  ·           1  ·       0.15  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  addAddressesToAdmins           ·      -  ·      -  ·    24798  ·           1  ·       0.25  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  addAddressesToWhitelist        ·      -  ·      -  ·    25085  ·           1  ·       0.25  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  claimOwnership                 ·      -  ·      -  ·    19732  ·           1  ·       0.20  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  removeAddressesFromAdmins      ·  21720  ·  24641  ·    23181  ·           2  ·       0.23  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  removeAddressesFromWhitelist   ·  15836  ·  27885  ·    19959  ·           5  ·       0.20  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  renounceOwnership              ·      -  ·      -  ·    14371  ·           1  ·       0.14  │
····················|·································|·········|·········|···········|··············|··············
|  Whitelist        ·  transferOwnership              ·      -  ·      -  ·    44278  ·           1  ·       0.45  │
····················|·································|·········|·········|···········|··············|··············
|  Deployments                                        ·                               ·  % of limit  ·             │
······················································|·········|·········|···········|··············|··············
|  BasicTokenMock                                     ·      -  ·      -  ·   380939  ·       5.7 %  ·       3.84  │
······················································|·········|·········|···········|··············|··············
|  ERC223TokenMock                                    ·      -  ·      -  ·   509575  ·       7.6 %  ·       5.14  │
······················································|·········|·········|···········|··············|··············
|  SafeERC20Helper                                    ·      -  ·      -  ·  1016291  ·      15.1 %  ·      10.25  │
······················································|·········|·········|···········|··············|··············
|  SafeMathMock                                       ·      -  ·      -  ·   227921  ·       3.4 %  ·       2.30  │
······················································|·········|·········|···········|··············|··············
|  TRVLToken                                          ·      -  ·      -  ·  5091829  ·      75.7 %  ·      51.34  │
·-----------------------------------------------------|---------|---------|-----------|--------------|-------------·
```
