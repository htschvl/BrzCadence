import BrzToken from 0xf8d6e0586b0a20c7
import FungibleToken from 0xee82856bf20e2aa6


pub fun main(address: Address): UFix64 {
    let acct = getAccount(address)
    let userCap = acct.getCapability<&BrzToken.Vault{FungibleToken.Balance}>(BrzToken.VaultPublicPath).borrow() ?? panic("Any Capability at this path")
    return userCap.balance
}
