# Encryption

## Hashing

  Ensures integrity.
  One-way encryption, hash can't be un-hashed to provide plaintext. Various algorithms can be used (MD5, SHA-1, SHA-2, SHA-3) - it's a balance between complexity/size and security

  Plaintext is scrabmled to create a *digest*, so recipient, after decoding the message, can run the same algorithm and see if digests are same.

### Salting

  Rainbow table attack - like a dictionary attack, but a dictionary contains hashes for popular phrases (passwords).
  Salting is adding additional data to password and then hashing.

## Block and Stream Encryption

### Block Encryption

  Encrypts blocks of fixed-length data.

  __AES__ (Advanced Encryption Standard) - multiple bit lengths for the key (128, 192, 256). Blocks are always 128 bits long.

  "AES allows 128, 192 or 256 bit key length. That is 16, 24 or 32 byte." So a key longer than that has to be hashed first to fit. [More on keys here](https://github.com/ricmoo/aes-js#what-is-a-key).

  For two plaintext blocks, even if these is just a one-bit difference, AES will produce two completely different ciphertext blocks.

  AES modes of operation:
  - __ECB__ (Electronic Codebook Mode) - encrypts blocks, one by one - so two identical blocks of plaintext will result in two identical blocks of ciphertext.
  - __CBC__ (Cipher Block Chaining Mode) - first block is XOR'ed against a random number (__IV__ - Initialization Vector), then next block is XOR'ed against ciphertext from preceding block. IV does not have to be secret, but it should not be reused.

### Stream Encryption

  Encrypts bit by bit (good for real-time encryption)


## Symmetric and Asymmetric Encryption

### Symmetric

  Uses the same key for encryption and decryption.

### Asymmetric aka Public Key Cryptography

  There are __two keys__ - public and private.
  Anything encrypted with a public key can be decrypted with matching private key.
  Anything encrypted with a private key can be decrypted with matching public key.

  Two steps:

  1. __Confidentiality__ - Bob encrypts the plaintext with Alice's public key (so only she can decrypt it).

  2. __Proof of Origin__ - Bob encrypts the resulting ciphertext with his private key (so Alice can decrypt it with his public key and therefore be sure that it came from him).


  Hybrid Encryption - SSL and HTTPS - first asymmetric, to establish a session key (initialization aka handshake), and then symmetric to carry on communication.

  TLS will replace SSL.

  __RSA__ - is the gold standard algorithm - uses large primes to generate key pairs

#### Non-Key-Based Asymmetric Cryptography

  Because key distribution is a challenge.

  __Diffie-Hellman Key Exchange__ - establishes a shared secret between two parties that can be used for secret communication for exchanging data over a public network. The key is never saved anywhere, it's used only for one exchange. [Non-mathematical explanaiton here](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange#Description).

## Digital signatures

  For emails - __S/MIME__ - provides integrity, but not necessarily confidentiality.

  __Non-repudiation__: You can't deny that you sent the message.

## XORing (symbol is `⊕`)

  aka how many bits are different (0 or 1)

  | A   | 0 | 1 | 1 | 0 |
  | -   | - |
  | B   | 0 | 1 | 0 | 1 |
  | A⊕B | 0 | 0 | 1 | 1 |
