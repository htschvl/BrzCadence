import ExampleToken from 0x01
import FungibleToken from 0xe355c280131dfaf18bf1c3648aee3c396db6b5fd
transaction (){
  prepare(acct: AuthAccount) {
    let adminStorage = acct.borrow<&ExampleToken.Pauser>(from: ExampleToken.PauserStoragePath)!
    adminStorage.pauseUnpauseTokens()
  }

  execute {
  }
}
