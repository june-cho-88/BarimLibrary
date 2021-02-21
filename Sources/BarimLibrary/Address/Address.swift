//
//  Address.swift
//
//
//  Created by Junhyung Cho on 2021/02/12.
//

import Foundation

protocol Address {
}

enum AddressError: Error {
    case invalid
    case notAvailable(scriptFormat: Script.Format)
}
