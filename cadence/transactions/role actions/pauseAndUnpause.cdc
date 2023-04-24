import BrzToken from 0xf8d6e0586b0a20c7
import FungibleToken from 0xee82856bf20e2aa6

transaction (){
  prepare(acct: AuthAccount) {
    let adminStorage = acct.borrow<&BrzToken.Pauser>(from: BrzToken.PauserStoragePath)!
    adminStorage.pauseUnpauseTokens()
  }

  execute {
  }
}
