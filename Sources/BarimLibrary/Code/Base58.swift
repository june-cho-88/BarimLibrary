//
//  Base58.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation

struct Base58: BaseCodable {
    let alphabets: String = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    
    func encode(_ data: Data) -> String {
        let size = Int(Double(data.count) * log(256)/log(Double(baseNumber))) + 1
        var encodedBytes = Array<UInt8>(repeating: 0, count: size)
        
        for byte in removeLeadingZero(from: data) {
            var carry = Int(byte)
            for index in (0..<size).reversed() {
                carry += 256 * Int(encodedBytes[index])
                encodedBytes[index] = UInt8(carry%baseNumber)
                carry /= baseNumber
                
                //TODO: fix this inefficient algorithm.
                if carry == 0 && (carry%baseNumber) == 0 && carry/baseNumber == 0 {
                    //print("\(encodedBytes) - \(carry%baseNumber):\(carry/baseNumber)-\(carry)(\(index))")
                }
            }
        }
        
        var result = ""
        
        for byte in removeLeadingZero(from: Data(encodedBytes)) {
            result += String(alphabets[String.Index.init(utf16Offset: Int(byte), in: alphabets)])
        }
        
        return result
    }
}
