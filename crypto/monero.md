# Monero

is a cryptocurrency, that is

- __private__: transactions and wallet balances are not publicly visible on the blockchain
- __untraceable__: it's ambiguous which funds have been spent, and thus extremely unlikely that a transaction could be linked to particular user

## How to get Monero?

Buy it with Bitcoin or other cryptocurrency on [shapeshift.io](https://shapeshift.io/) or other cryptocurrency exchange.

## A wallet

Generating a unique address for each transaction is not necessary, you can have just one, like a bank account. You can generate a *paper wallet* on [moneroaddress.org](https://moneroaddress.org/), [mymonero.com](https://mymonero.com/), or using the software as described below.

A wallet has a __public address__, a __mnemonic seed__, and a pair of keys - __spend key__ and __view key__. All keys can be recovered from the mnemonic seed, so that's the only part that needs to be stored safely (or remembered).

## Setting up a wallet

[mymonero.com](https://mymonero.com/) can be used, but doing it on command line is more fun:

(on macOS, using [Homebrew](http://brew.sh))

A wallet program and a program running the Monero blockchain are needed. For some uses wallet program is enough, but not for making transactions or checking the balance.

- `$ brew tap sammy007/cryptonight` - adds a brew tap (where Homebrew looks for formulae)
- `$ brew install monero` - installs `monerod` and `monero-wallet-cli`
- `$ monerod` - starts running the blockchain
- `$ monero-wallet-cli` - starts wallet program, without any flags it will generate a new wallet

## Loading a wallet

- `$ monerod` - starts running the blockchain, then in separate window:
- `$ monero-wallet-cli --wallet-file <filename>`

## Checking balance

Once in wallet program, run `balance` or `refresh`.

---
sources
- https://getmonero.org/home
- https://monerobase.com/Simplewallet
- https://monerobase.com/FAQ
- https://getmonero.org/knowledge-base/user-guides/simplewallet
