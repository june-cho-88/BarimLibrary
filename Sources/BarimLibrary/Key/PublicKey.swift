//
//  PublicKey.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation
import secp256k1_implementation

struct PublicKey {
    let privateKey: PrivateKey
    
    var data: Data {
        do {
            return try secp256k1.Signing.PrivateKey(rawRepresentation: privateKey.data).publicKey.rawRepresentation
        } catch {
            print(error.localizedDescription)
            return Data()
        }
    }
    
    var hash160: Data {
        return HASH160.hash(data: data)
    }
}
