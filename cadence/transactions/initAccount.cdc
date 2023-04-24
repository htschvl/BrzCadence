import ExampleToken from 0x01
import FungibleToken from 0xe355c280131dfaf18bf1c3648aee3c396db6b5fd

transaction {

  prepare(acct: AuthAccount) {
    //first step: call the public function on ExampleToken to create a new empty vault
    let newVault <- ExampleToken.createEmptyVault()

    //second step: save this new empty vault inside user wallet. We will save it inside user account storage inside a path that ExampleToken contract recommend us
    acct.save(<- newVault, to: ExampleToken.VaultStoragePath)  

    //third step: link the stored vault it's a function that will save a reference from a resource on another place
    //in this case here, we are saving a reference from vault inside a public path
    //to make sure that this reference contains only functions that anyone can call (like deposit) we add to it a interface type {FungibleToken.Receiver}
    acct.link<&ExampleToken.Vault{FungibleToken.Receiver, FungibleToken.Balance}>(ExampleToken.VaultPublicPath, target: ExampleToken.VaultStoragePath)
  }

  execute {
  }
}
