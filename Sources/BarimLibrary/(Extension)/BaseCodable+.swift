//
//  BaseCodable+.swift
//
//
//  Created by Junhyung Cho on 2021/02/08.
//

import Foundation

extension BaseCodable {
    var baseNumber: Int { self.alphabets.count }
    
    func decode(_ string: String) -> Data {
        return Data()
    }
}

extension BaseCodable {
    func removeLeadingZero(from data: Data) -> Data {
        var numberOfLeadingZero = 0
        for byte in data {
            guard byte == 0 else { break }
            numberOfLeadingZero += 1
        }
        
        return data.dropFirst(numberOfLeadingZero)
    }
}

extension BaseCodable where Self == Base32 {
    
}
