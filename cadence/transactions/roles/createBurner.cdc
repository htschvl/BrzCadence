import ExampleToken from 0x01
import FungibleToken from 0xe355c280131dfaf18bf1c3648aee3c396db6b5fd

transaction (amount: UFix64){

  prepare(acct: AuthAccount, receiver: AuthAccount) {
    let adminStorage = acct.borrow<&ExampleToken.Administrator>(from: ExampleToken.AdminStoragePath) ?? panic("No Admin Path found")
    let burner <- adminStorage.createNewBurner(allowedAmount: amount)

    receiver.save(<- burner, to: ExampleToken.BurnerStoragePath)
  }

  execute {
  }
}