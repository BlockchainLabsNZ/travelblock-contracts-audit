# TravelBlock Smart Contracts Audit Report

Prepared by:

- Bruce Li, bruce@blockchainlabs.nz
- Matt Lough, matt@blockchainlabs.nz

## Preamble

This audit report was undertaken for TravelBlock, by their request, and has subsequently been shared publicly without any express or implied warranty.

Solidity contracts were sourced directly from the TravelBlock team and the most recent commit we have audited is [this commit](https://github.com/BlockchainLabsNZ/travelblock-contracts-audit/commit/cbec61bb1087e18e545aacb507246591cd313f06)

We would encourage all community members and token holders to make their own assessment of the contracts.

## Scope

The following contracts were subject for analysis:
- `contracts/`
  - `Admin.sol`
  - `RewardToken.sol`
  - `TRVLToken.sol`
  - `Whitelist.sol`
# Analysis

- [Funcitonal test](functional-test.md)
- [Dynamic Analysis](dynamic-analysis.md)
- [Test Coverage](test-coverage.md)
- [Gas Consumption](gas-consumption.md)
- [Static Analysis] see below

## Issues

### Severity Description
<table>
<tr>
  <td>Minor</td>
  <td>A defect that does not have a material impact on the contract execution and is likely to be subjective.</td>
</tr>
<tr>
  <td>Moderate</td>
  <td>A defect that could impact the desired outcome of the contract execution in a specific scenario.</td>
</tr>
<tr>
  <td>Major</td>
  <td> A defect that impacts the desired outcome of the contract execution or introduces a weakness that may be exploited.</td>
</tr>
<tr>
  <td>Critical</td>
  <td>A defect that presents a significant security vulnerability or failure of the contract across a range of scenarios.</td>
</tr>
</table>

### Minor
- **Naming problem reduces code readability** `best practice` <br>
The names of the function and return are prone to confusing. It looks like gets/returns a percentage, but actually returns an amount of calculated reward tokens. <br>
RewardToken.sol, Line 87:
  ```
  _rewardPercentage = _amount.mul(rewardPercentage[_rewardPercentageIndex]).div(rewardPercentageDivisor);
  ```
  [View on GitHub](https://github.com/BlockchainLabsNZ/travelblock-contracts-audit/issues/1)

- **Enforce the use of specific Solidity compiler version** `best practice` <br>
The code is declaring the following `pragma solidity ^0.4.24` which is latest version currently. 
The use of `^` states that any solc compiler greater or equal to `0.4.24` and lower than `0.5.0` can be used to run the code.
However, there could be some discrepancies in the compiled code causing unexpected behaviour when using different solidity version.
Therefore we recommend using `pragma solidity 0.4.24` without the `^` and adding `"solc": "0.4.24"` to the dependencies to enforce testing, compiling and deploying with that compiler.
  [View on GitHub](https://github.com/BlockchainLabsNZ/travelblock-contracts-audit/issues/2)
### Moderate

- None found

### Major

- None found

### Critical

- None found

# Conclusion
The contracts show care taken by the development team to follow the latest features and a strong knowledge of Solidity. All the contracts are well written and orgnized. And fully-tested framework, openzeppelin-solidity, is used for better code security and efficient programming. Additionally, there is a very high test coverage which should increase confidence in the security of these contracts, and their maintainability in the future.<br>
Overall we are satisfied that these Smart Contracts do not exhibit any known security vulnerabilities. 

## Checklist of Static Analysis [Attachment]
### Gas Optimization
* [x] Using string in struct costs more gas than bytes32. [example](https://github.com/BlockchainLabsNZ/mothership-sen/issues/3)
* [x] Avoid checking if a uint is greater than 0 [example](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/6)
* [x] Don't assign a variable which is about to be returned [example](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/5)
* [x] Avoid assigning global variables to a local variable. [example](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/2)
* [x] uint256 can be used instead of uint8 to save gas. [example](https://github.com/BlockchainLabsNZ/bankorus_contracts_audit/issues/2) and the [reason](https://ethereum.stackexchange.com/questions/3067/why-does-uint8-cost-more-gas-than-uint256)


### Best Practices
* [x] Have all declared variables/modifiers/functions/events/files been used? [example_1](https://github.com/BlockchainLabsNZ/zipper-contracts/issues/4), [example_2](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/13)
* [x] Prefer explicit declaration of variable types. [example_1](https://github.com/BlockchainLabsNZ/staking-contracts-audit/issues/3), [example_2](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/9)
* [x] Prefer explicit declaration of variables access modifiers. [example](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/8)
* [x] Always use latest stable version of the compiler. [example](https://github.com/BlockchainLabsNZ/staking-contracts-audit/issues/1)
* [x] Dead code should be removed. [example](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/7)
* [x] Consistent naming convention (normally CamelCase). [example_1](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/4), [example_2](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/3)
* [x] Avoid magic numbers. [example](https://github.com/BlockchainLabsNZ/bluzelle-contracts/issues/3)
* [x] Comments needs should be up to date and reflect code logic. [example](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/11)
* [x] Prefer require over revert [example](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/13)
* [x] Token delivery should be decentralized, an owner should not have to "push" them to the investor [example](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/12)
* [x] Use only english in comments [example](https://github.com/BlockchainLabsNZ/LAToken-Contracts-Audit/issues/25)
* [x] Recommend using braces for single line if/for statement. [example](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/5). [discussion](https://stackoverflow.com/questions/2125066/is-it-bad-practice-to-use-an-if-statement-without-brackets)
* [x] Improve code readability by making use of solidity time uints. [example](https://github.com/BlockchainLabsNZ/leverj-contracts/issues/8)
* [x] If you are implementing from an interface then it should be declared. [example](https://github.com/BlockchainLabsNZ/poa-popa/issues/2)
* [x] Repeated safety checks can be replaced by modifier. [example](https://github.com/BlockchainLabsNZ/poa-popa/issues/1)
* [x] A function should return a result if it's declaration says that it's going to. [example](https://github.com/BlockchainLabsNZ/LINA-TokenERC20/issues/1)
* [x] Public variables and functions should have different names to avoid duplicates. [example](https://github.com/BlockchainLabsNZ/LINA-TokenERC20/issues/2)


### Code Correctness
* [x] Token state changes should log an event e.g transfer/mint/burn/change owner, etc [example_1](https://github.com/BlockchainLabsNZ/zipper-contracts/issues/1), [example_2](https://github.com/BlockchainLabsNZ/staking-contracts-audit/issues/2)
* [x] Contract fully implements the ERC20 standard. [Standard definition](https://theethereum.wiki/w/index.php/ERC20_Token_Standard)
* [x] Convention is to use capital letters for the token "symbol". [example](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/6)
* [x] The declaration of pragma version should be at the top of the file, before any imports happen. [example](https://github.com/BlockchainLabsNZ/staking-contracts-audit/issues/1)
* [x] Enforce the use of specific Solidity compiler version. [example_1](https://github.com/BlockchainLabsNZ/wings-private-contracts/issues/10), [example_2](https://github.com/BlockchainLabsNZ/leverj-contracts/issues/5)
* [x] Safemath should be used [example](https://github.com/BlockchainLabsNZ/leverj-contracts/issues/4)
* [x] Use .transfer instead of .send. [example](https://github.com/BlockchainLabsNZ/gifto-contracts/issues/10)
* [x] Functions should throw an error instead of returning false. [example](https://github.com/BlockchainLabsNZ/mobilego-contracts-audit/issues/1)
* [x] Measure time milestones with timestamps, not block height. [example](https://github.com/BlockchainLabsNZ/leverj-contracts/issues/6)
* [x] Favour require() over if( throw; ) statements. [example](https://github.com/BlockchainLabsNZ/mothership-sen/issues/1)

### Known Security Weaknesses
* [x] Integer Overflow or Underflow [example](https://ethereumdev.io/safemath-protect-overflows/)
* [x] Re-entrancy attacks [example](https://medium.com/@gus_tavo_guim/reentrancy-attack-on-smart-contracts-how-to-identify-the-exploitable-and-an-example-of-an-attack-4470a2d8dfe4)
* [x] DoS with reverts [example](https://consensys.github.io/smart-contract-best-practices/known_attacks/#dos-with-unexpected-revert)
* [x] DoS with Block Gas Limit [example](https://consensys.github.io/smart-contract-best-practices/known_attacks/#dos-with-block-gas-limit)

### Documentation
* [ ] Whitepaper/high level overview
* [ ] Business logic described
* [ ] Code is well documented, comments are relevant
* [ ] Meaningful variables and function names

___

### Disclaimer

Our team uses our current understanding of the best practises for Solidity and Smart Contracts. Development in Solidity and for Blockchain is an emerging area of software engineering which still has a lot of room to grow, hence our current understanding of best practices may not find all of the issues in this code and design.

We have not analysed any of the assembly code generated by the Solidity compiler. We have not verified the deployment process and configurations of the contracts. We have only analysed the code outlined in the scope. We have not verified any of the claims made by any of the organisations behind this code.

Security audits do not warrant bug-free code. We encourage all users interacting with smart contract code to continue to analyse and inform themselves of any risks before interacting with any smart contracts.

