//
//  Script.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation

struct Script {
    enum Format {
        case p2pk
        case p2pkh
        case p2ms
        case p2sh
        case null
        
        var string: String {
            switch self {
            case .p2pk:
                return "PayToPublicKey"
            case .p2pkh:
                return "PayToPublicKeyHash"
            case .p2ms:
                return "PayToMultiSignature"
            case .p2sh:
                return "PayToScriptHash"
            case .null:
                return "null"
            }
        }
    }
    
    let data: Data
}
