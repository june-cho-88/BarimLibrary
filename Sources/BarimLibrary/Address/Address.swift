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
    case invalid(error: Error)
    case notAvailable(scriptFormat: Script.Format)
}
