//
//  Data+.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation

extension Data {
    func convertTo5Bit(pad: Bool) -> Data {
        var jar: Int = 0
        var bits: UInt8 = 0
        let maximumValue: Int = 0b000_11111
        var converted: [UInt8] = [UInt8]()
        for byte in self {
            jar = (jar << 8) | Int(byte)
            bits += 8
            while bits >= 5 {
                bits -= 5
                converted.append(UInt8(jar >> Int(bits) & maximumValue))
            }
        }
        
        let lastBits: UInt8 = UInt8(jar << (5 - bits) & maximumValue)
        if pad && bits > 0 {
            converted.append(lastBits)
        }
        return Data(converted)
    }
    
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}
