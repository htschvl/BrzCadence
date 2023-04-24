import ExampleToken from 0x01
import FungibleToken from 0xe355c280131dfaf18bf1c3648aee3c396db6b5fd

pub fun main(address: Address): UFix64 {
    let acct = getAccount(address)
    let userCap = acct.getCapability<&ExampleToken.Vault{FungibleToken.Balance}>(ExampleToken.VaultPublicPath).borrow() ?? panic("Any Capability at this path")
    return userCap.balance
}
