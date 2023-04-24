import ExampleToken from 0x01
import FungibleToken from 0xe355c280131dfaf18bf1c3648aee3c396db6b5fd

transaction (amount: UFix64, receiverAddress: Address){

  prepare(acct: AuthAccount) {
    let adminStorage = acct.borrow<&ExampleToken.Minter>(from: ExampleToken.MinterStoragePath)!
    let mintedTokensVault <- adminStorage.mintTokens(amount: amount)

    let receiver = getAccount(receiverAddress)
    let receiverCapability = receiver.getCapability<&ExampleToken.Vault{FungibleToken.Receiver}>(ExampleToken.VaultPublicPath).borrow() ?? panic("User doesn't contains this capability on this path")
    receiverCapability.deposit(from: <- mintedTokensVault)
  }

  execute {
  }
}
