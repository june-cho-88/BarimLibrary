//
//  HASH160.swift
//
//
//  Created by Junhyung Cho on 2021/02/10.
//

import Foundation
import CryptoKit

struct HASH160 {
    static func hash(data: Data) -> Data {
        let sha256 = SHA256.hash(data: data)
        let ripemd160 = RIPEMD160.hash(data: Data(sha256))
        return ripemd160
    }
}
