# Functional tests
Tests are conducted on the Kovan test network. The following contracts has been verified on Etherscan.
 
## [`TRVLToken[0xb60237]`](https://kovan.etherscan.io/address/0xD7c5f014dad18E53702eAd0e2b1ae50F8D7C1b63#code)

 
## Accounts
 
* Owner: [0x006F3FCdDaf248D1a4C9A7fd62939963AAAe5a67](https://kovan.etherscan.io/address/0x006F3FCdDaf248D1a4C9A7fd62939963AAAe5a67)
* Admin: [0x00c7e82F3E4615a50C70262b16AEDf05C7D4E211](https://kovan.etherscan.io/address/0x00c7e82F3E4615a50C70262b16AEDf05C7D4E211)
* Whitelisted user: [0xC68600BB45a58a316a80af6B48baeB9CD3D72Bd2](https://kovan.etherscan.io/address/0xC68600BB45a58a316a80af6B48baeB9CD3D72Bd2)
## Expected behaviour tests
 
- [x] Owner can add addresses to admin list. [0x721f4f](https://kovan.etherscan.io/tx/0x721f4f33837af81b15d04d3718684330258ef1121086f9c03a9548195dfadd18).
- [x] owner can remove addresses from admin list. [0x7f2d4f](https://kovan.etherscan.io/tx/0x7f2d4f31c07fe4114875b60753773d924dbf8eb92c166ac16b1a9c1c42fba6e0)
- [x] Admin can add addresses to whitelist. [0x344e52](https://kovan.etherscan.io/tx/0x344e52d21597da535f1ea3f9b1139d4db7bef7b477a32d9a8ad661a5d653f532)
- [x] Admin can remove addresses from whitelist. [0x986197](https://kovan.etherscan.io/tx/0x986197f3f9814d2261b2ed090b845da62d6fd2c3954eab5596c69612b05982d1)
- [x] Admin can add new percentage to the array.[0xdf3d33](https://kovan.etherscan.io/tx/0xdf3d33dadba40abb3045e367aca100dd7c8d15dae9d2baaa8820efd3cb943eca)
- [x] Admin can update existing percentage by index.[0x7cc010](https://kovan.etherscan.io/tx/0x319b4fecb3be883b4b34ceffde6135edcba399ce34c0016772806adebedf6084)
- [x] Token can be transfered when it is not paused.[0x6d401e](https://kovan.etherscan.io/tx/0x6d401e73e4399700f3e837c3b729fd18787756926808d0b5e7dc8c28333a4866)
- [x] Owner can convert his own regular tokens to reward tokens and transfer to a specific user. [0x244373](https://kovan.etherscan.io/tx/0x244373e4d49d01a6136b46a8a29c752d6b4a30e1df1b682a12fc2afc131c97ea)
- [x] paymentRegularTokensPriority() is working properly.[0x2b6cc7](https://kovan.etherscan.io/tx/0x2b6cc7d6b4951ac097a740455a765a3f6d92d570e7bd390e12a57e6610b040ec)
- [x] paymentRewardTokenPriority() is working properly. [0x1efeee](https://kovan.etherscan.io/tx/0x1efeee8511ecee361f861fc9f1befcc75b70142ebc25d7a6f1478f437566f577)
- [x] paymentMixed() is working properly.[0xcaf313](https://kovan.etherscan.io/tx/0xcaf313b4421492c6d6735bd292fa62e7145a08c6e6957e21f13375a1776fb66e)
- [x] Whitelisted user can pay with only regular tokens. [0xb7b3cf](https://kovan.etherscan.io/tx/0xb7b3cfd446aa8a8590e8e1cd6078a5fd697322b1cc23777b97f6a85cf9b2f19e)
- [x] Whitelisted user can pay with only reward tokens. [0xf3bef2](https://kovan.etherscan.io/tx/0xf3bef2568ccfddff692d871b18dcdae28bcecd6a7a851c55c23c54ed0e1df95f)
