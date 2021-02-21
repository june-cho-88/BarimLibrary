//
//  Base32.swift
//
//
//  Created by Junhyung Cho on 2021/02/07.
//

import Foundation

struct Base32: BaseCodable {
    let alphabets: String = "qpzry9x8gf2tvdw0s3jn54khce6mua7l"
    
    func encode(_ data: Data) -> String {
        let encodedBytes = Array(data.convertTo5Bit(pad: true))
        var result = ""
        for byte in encodedBytes {
            result += String(alphabets[String.Index.init(utf16Offset: Int(byte), in: alphabets)])
        }
        
        return result
    }
    
    func encode(_ number: Int) -> String {
        var result = ""
        var carry = number
        while carry > 0 {
            result += String(alphabets[String.Index.init(utf16Offset: carry%baseNumber, in: alphabets)])
            carry = carry/baseNumber
        }
        
        return String(result.reversed())
    }
}
