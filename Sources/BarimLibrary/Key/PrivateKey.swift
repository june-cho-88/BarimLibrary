//
//  PrivateKey.swift
//
//
//  Created by Junhyung Cho on 2021/02/05.
//

import Foundation
import CryptoKit

struct PrivateKey {
    let data: Data
    
    init() {
        var bytes = [UInt8](repeating: 0, count: 32)
        let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
        guard status == errSecSuccess else { fatalError() }
        
        self.data = Data(bytes)
    }
    
    init?(seedString: String) {
        guard let seedData = seedString.data(using: .utf8) else { return nil }
        self.data = Data(SHA256.hash(data: seedData))
    }
}
