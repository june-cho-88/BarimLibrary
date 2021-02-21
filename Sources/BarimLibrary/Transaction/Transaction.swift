//
//  Transaction.swift
//
//
//  Created by Junhyung Cho on 2021/02/21.
//

import Foundation

struct Transaction {
    struct Output: Hashable {
        let value: UInt
        let lockingScript: Data
    }
    
    struct Input: Hashable {
        let previousTransactionHash: Data
        let outputIndex: UInt
        let unlockingScript: Data
        let sequenceNumber: UInt
    }
    
    let version: UInt
    let locktime: UInt
    let inputs: Set<Input>
    let outputs: Set<Output>
}
