import BrzToken from 0xf8d6e0586b0a20c7
import FungibleToken from 0xee82856bf20e2aa6

transaction (amount: UFix64){

  prepare(acct: AuthAccount, receiver: AuthAccount) {
    let adminStorage = acct.borrow<&BrzToken.Administrator>(from: BrzToken.AdminStoragePath) ?? panic("No Admin Path found")
    let minter <- adminStorage.createNewMinter(allowedAmount: amount)

    receiver.save(<- minter, to: BrzToken.MinterStoragePath)
  }

  execute {
  }
}