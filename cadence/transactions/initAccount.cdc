import BrzToken from 0xf8d6e0586b0a20c7
import FungibleToken from 0xee82856bf20e2aa6


transaction {

  prepare(acct: AuthAccount) {
    //first step: call the public function on BrzToken to create a new empty vault
    let newVault <- BrzToken.createEmptyVault()

    //second step: save this new empty vault inside user wallet. We will save it inside user account storage inside a path that BrzToken contract recommend us
    acct.save(<- newVault, to: BrzToken.VaultStoragePath)  

    //third step: link the stored vault it's a function that will save a reference from a resource on another place
    //in this case here, we are saving a reference from vault inside a public path
    //to make sure that this reference contains only functions that anyone can call (like deposit) we add to it a interface type {FungibleToken.Receiver}
    acct.link<&BrzToken.Vault{FungibleToken.Receiver, FungibleToken.Balance}>(BrzToken.VaultPublicPath, target: BrzToken.VaultStoragePath)
  }

  execute {
  }
}
 