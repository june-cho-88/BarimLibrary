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
    case failed(error: Error)
    case invalid(_ string: String)
    case notAvailable(scriptFormat: Script.Format)
}
