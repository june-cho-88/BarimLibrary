//
//  BaseCodable.swift
//
//
//  Created by Junhyung Cho on 2021/02/07.
//

import Foundation

protocol BaseCodable {
    var baseNumber: Int { get }
    var alphabets: String { get }
    
    func encode(_ data: Data) -> String
    func decode(_ string: String) -> Data
}
