//
//  LegacyAddress.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation
import CryptoKit

struct LegacyAddress {
    let publicKey: PublicKey
    let scriptFormat: Script.Format
    
    init(publicKey: PublicKey, scriptFormat: Script.Format) throws {
        self.publicKey = publicKey
        self.scriptFormat = scriptFormat
        
        guard scriptFormat == .p2pkh else { throw AddressError.notAvailable(scriptFormat: self.scriptFormat) }
    }
    
    var prefix: Data {
        switch scriptFormat {
        case .p2pkh:
            return Data([0x00])
        case .p2sh:
            return Data([0x05])
        default: fatalError()
        }
    }
    
    var data: Data {
        switch scriptFormat {
        case .p2pk:
            return publicKey.data
        case .p2pkh:
            return publicKey.hash160
        case .p2sh:
            return publicKey.hash160
        default: fatalError(AddressError.notAvailable(scriptFormat: scriptFormat).localizedDescription)
        }
    }
    
    var checksum: Data {
        let firstHash = SHA256.hash(data: (prefix + publicKey.hash160))
        let secondHash = SHA256.hash(data: Data(firstHash))
        return Data(secondHash)[0...3]
    }
    
    var string: String? {
        return (prefix == Data([0x00]) ? "1" : "") + Base58().encode(prefix + publicKey.hash160 + checksum)
    }
}
