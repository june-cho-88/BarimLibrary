//
//  CashAddress.swift
//
//
//  Created by Junhyung Cho on 2021/02/07.
//

import Foundation

struct CashAddress {
    let legacy: LegacyAddress
    
    let network: Network
    
    var versionBytes: Data {
        Data([firstBit+typeBits+sizeBits])
    }
    
    var payload: Data {
        return versionBytes + legacy.data
    }
    
    var prefix: String {
        switch self.network {
        case .mainnet: return "bitcoincash"
        case .testnet: return "bchtest"
        case .regtest: return "bchreg"
        }
    }
    
    let separator: String = ":"
    
    var checksum: UInt {
        var jar: Data = Data()
        
        for byte in Array<UInt8>(prefix.utf8) {
            jar += Data([byte & 0b00011111])
        }
        jar += Data(repeating: 0, count: 1)
        jar += payload.convertTo5Bit(pad: true)
        jar += Data(repeating: 0, count: 8)
        
        return PolyMod().encode(jar)
    }
    
    var string: String {
        let base32Payload = Base32().encode(payload)
        let base32Checksum = Base32().encode(Int(checksum))
        let result = prefix + separator + base32Payload + base32Checksum
        return result
    }
}

extension CashAddress {
    enum Network {
        case mainnet, testnet, regtest
    }
    var dataSize: Int {
        return self.legacy.data.count
    }
    
    var firstBit: UInt8 { return 0b0 }
    var typeBits: UInt8 {
        switch self.legacy.scriptFormat {
        case .p2pkh: return 0b0000
        case .p2sh: return 0b0001
        default: fatalError()
        }
    }
    var sizeBits: UInt8 {
        switch dataSize*8 {
        case 160: return 0b000
        case 192: return 0b001
        case 224: return 0b010
        case 256: return 0b011
        case 320: return 0b100
        case 384: return 0b101
        case 448: return 0b110
        case 512: return 0b111
        default: fatalError()
        }
    }
}

extension CashAddress {
    static let example: [UInt8] = [0x21, 0x1b, 0x74, 0xca,
                                   0x46, 0x86, 0xf8, 0x1e,
                                   0xfd, 0xa5, 0x64, 0x17,
                                   0x67, 0xfc, 0x84, 0xef,
                                   0x16, 0xda, 0xfe, 0x0b]
}
