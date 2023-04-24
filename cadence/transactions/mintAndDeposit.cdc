import BrzToken from 0xf8d6e0586b0a20c7
import FungibleToken from 0xee82856bf20e2aa6


transaction (amount: UFix64, receiverAddress: Address){

  prepare(acct: AuthAccount) {
    let adminStorage = acct.borrow<&BrzToken.Minter>(from: BrzToken.MinterStoragePath)!
    let mintedTokensVault <- adminStorage.mintTokens(amount: amount)

    let receiver = getAccount(receiverAddress)
    let receiverCapability = receiver.getCapability<&BrzToken.Vault{FungibleToken.Receiver}>(BrzToken.VaultPublicPath).borrow() ?? panic("User doesn't contains this capability on this path")
    receiverCapability.deposit(from: <- mintedTokensVault)
  }

  execute {
  }
}
