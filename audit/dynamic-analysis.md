# Dynamic Analysis

```
  Contract: StandardToken
    balanceOf
      when the requested account has no tokens
        ✓ returns zero (40ms)
      when the requested account has some tokens
        ✓ returns the total amount of tokens (61ms)
    transfer
      when the recipient is not the zero address
        when the sender does not have enough balance
          ✓ reverts (147ms)
        when the sender has enough balance
          ✓ transfers the requested amount (176ms)
          ✓ emits a transfer event (95ms)
      when the recipient is the zero address
        ✓ reverts (42ms)

  Contract: CanReclaimToken - TravelBlock
    ✓ should allow owner to reclaim tokens (125ms)
    ✓ should allow only owner to reclaim tokens

  Contract: Claimable - TravelBlock
    ✓ should have an owner
    ✓ changes pendingOwner after transfer (71ms)
    ✓ should prevent to claimOwnership from no pendingOwner (181ms)
    ✓ should prevent non-owners from transfering (68ms)
    ✓ loses owner after renouncement (77ms)
    after initiating a transfer
      ✓ changes allow pending owner to claim ownership (69ms)

  Contract: HasNoTokens - TravelBlock
    ✓ should not accept ERC223 tokens (84ms)
    ✓ should allow owner to reclaim tokens (128ms)
    ✓ should allow only owner to reclaim tokens (38ms)

  Contract: PausableToken - TravelBlock
    pause
      when the sender is the token owner
        when the token is unpaused
          ✓ pauses the token (67ms)
          ✓ emits a Pause event (56ms)
        when the token is paused
          ✓ reverts (65ms)
      when the sender is not the token owner
        ✓ reverts (42ms)
    unpause
      when the sender is the token owner
        when the token is paused
          ✓ unpauses the token (67ms)
          ✓ emits an Unpause event (54ms)
        when the token is unpaused
          ✓ reverts (43ms)
      when the sender is not the token owner
        ✓ reverts (38ms)
    pausable token
      paused
        ✓ is not paused by default
        ✓ is paused after being paused (79ms)
        ✓ is not paused after being paused and then unpaused (118ms)
      transfer
        ✓ allows to transfer when unpaused (133ms)
        ✓ allows to transfer when paused and then unpaused (209ms)
        ✓ reverts when trying to transfer when paused (81ms)
      approve
        ✓ allows to approve when unpaused (68ms)
        ✓ allows to transfer when paused and then unpaused (157ms)
        ✓ reverts when trying to transfer when paused (81ms)
      transfer from
        ✓ allows to transfer from when unpaused (131ms)
        ✓ allows to transfer when paused and then unpaused (499ms)
        ✓ reverts when trying to transfer from when paused (89ms)
      decrease approval
        ✓ allows to decrease approval when unpaused (115ms)
        ✓ allows to decrease approval when paused and then unpaused (214ms)
        ✓ reverts when trying to transfer when paused (70ms)
      increase approval
        ✓ allows to increase approval when unpaused (74ms)
        ✓ allows to increase approval when paused and then unpaused (474ms)
        ✓ reverts when trying to increase approval when paused (367ms)

  Contract: SafeERC20
    ✓ should throw on failed transfer (88ms)
    ✓ should throw on failed transferFrom (77ms)
    ✓ should throw on failed approve (50ms)
    ✓ should not throw on succeeding transfer (183ms)
    ✓ should not throw on succeeding transferFrom (53ms)
    ✓ should not throw on succeeding approve (72ms)

  Contract: SafeMath
    add
      ✓ adds correctly
      ✓ throws an error on addition overflow
    sub
      ✓ subtracts correctly
      ✓ throws an error if subtraction result would be negative
    mul
      ✓ multiplies correctly
      ✓ handles a zero product correctly (39ms)
      ✓ throws an error on multiplication overflow
    div
      ✓ divides correctly
      ✓ throws an error on zero division

  Contract: StandardToken
    transfer from
      when the recipient is not the zero address
        when the spender has enough approved balance
          when the owner has enough balance
            ✓ transfers the requested amount (88ms)
            ✓ decreases the spender allowance (85ms)
            ✓ emits a transfer event (51ms)
          when the owner does not have enough balance
            ✓ reverts
        when the spender does not have enough approved balance
          when the owner has enough balance
            ✓ reverts
          when the owner does not have enough balance
            ✓ reverts
      when the recipient is the zero address
        ✓ reverts
    decrease approval
      when the spender is not the zero address
        when the sender has enough balance
          ✓ emits an approval event (45ms)
          when there was no approved amount before
            ✓ keeps the allowance to zero (77ms)
          when the spender had an approved amount
            ✓ decreases the spender allowance subtracting the requested amount (72ms)
        when the sender does not have enough balance
          ✓ emits an approval event (41ms)
          when there was no approved amount before
            ✓ keeps the allowance to zero (67ms)
          when the spender had an approved amount
            ✓ decreases the spender allowance subtracting the requested amount (69ms)
      when the spender is the zero address
        ✓ decreases the requested amount (63ms)
        ✓ emits an approval event (44ms)
    increase approval
      when the spender is not the zero address
        when the sender has enough balance
          ✓ emits an approval event (47ms)
          when there was no approved amount before
            ✓ approves the requested amount (80ms)
          when the spender had an approved amount
            ✓ increases the spender allowance adding the requested amount (164ms)
        when the sender does not have enough balance
          ✓ emits an approval event (54ms)
          when there was no approved amount before
            ✓ approves the requested amount (63ms)
          when the spender had an approved amount
            ✓ increases the spender allowance adding the requested amount (71ms)
      when the spender is the zero address
        ✓ approves the requested amount (76ms)
        ✓ emits an approval event (60ms)

  Contract: Create Travel Token Contract - TravelBlock
    Contract contains the correct amount of currently minted tokens
      ✓ Whitelist values are empty
      ✓ Reverts when add addresses to whitelist is called from a BadGuy (79ms)
      ✓ Reverts when whitelisted values are removed by a BadGuy (63ms)
      ✓ Allows Owner to call an adminOnly function, even if they are not explicitly on the admins list (181ms)
      ✓ Reverts when address(0) is added to whitelist (79ms)
      ✓ Reverts when address(0) is added to admins (68ms)
      ✓ Reverts when empty list is added to admins
      ✓ Reverts when empty list is removed to admins
      ✓ Adding admins who are already on admins, will not emit an event (53ms)
      ✓ Adding whitelisters who are already on whitelist, will not emit an event (64ms)
      ✓ Removing whitelisters who are not on whitelist, will not emit an event (53ms)
      ✓ Removing admins who are not admins already, will not emit an event (68ms)
      ✓ Values are removed by owner from whitelist (211ms)
      ✓ Values are removed by owner from admins (102ms)
      ✓ Tries to update a reward index that doesntexist (231ms)
      ✓ Reverts when a BadGuy tries to update percentage indexes (161ms)
      ✓ Updates an index value that exists when Owner calls it (147ms)
      ✓ Reverts when we try to add a 100% + 1 reward value (144ms)
      ✓ Add a 100% reward value (103ms)

  Contract: Create Travel Token Contract with default values -
    Contract is initialized
      user is removed from whitelist and cant process payments
        ✓ Reverts when an empty list is passed to removeAddressFromWhitelist function
        ✓ Reverts when an empty list is passed to addAddressToWhitelist function (61ms)
        ✓ User is removed from the whitelist (67ms)
        ✓ Reverts when the users who was removed tries to process a payment (135ms)
      User calls a paymentRegularTokens method
        ✓ Verifies token balances before we make alterations (158ms)
        ✓ Reverts with zero amount (49ms)
        ✓ Process payments (641ms)
        ✓ Reverts when the user tries to process payment that is more than they have (168ms)
        ✓ Reverts when non whitelisted users tries to process a payment (71ms)
        ✓ Check balances are updated accordingly (837ms)
      User calls a paymentRewardTokens method
        ✓ Reverts when non whitelisted user tries to process a payment (42ms)
        ✓ Make rewards payment (166ms)
        ✓ Reverts when user is out of reward tokens (226ms)
        ✓ check values are updated properly (639ms)
      User calls a paymentMixed method
        ✓ Reverts when non whitelisted user tries to process a payment (44ms)
        ✓ Make rewards payment - check values are updated properly (1832ms)
      User calls a paymentRegularTokensPriority method
        ✓ Check values updated (415ms)
        ✓ Reverts when non whitelisted user tries to process a payment (63ms)
        ✓ Reverts because user does not have enough tokens (77ms)
        ✓ Process Payments - Check Values (1689ms)
      User calls a paymentRewardTokensPriority method
        ✓ Check values updated (450ms)
        ✓ Reverts when non whitelisted user tries to process a payment (96ms)
        ✓ Reverts because user does not have enough tokens (148ms)
        ✓ Make rewards payment - check values stored (931ms)
      Owner converts tokens to user
        ✓ Check values updated (1021ms)
        ✓ Reverts when trying to convert tokens for a non-whitelisted user (603ms)
        ✓ Reverts when owner doesnt have enough tokens to convert (426ms)


  127 passing (2m)
```
