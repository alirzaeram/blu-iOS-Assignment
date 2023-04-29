//
//  EndPoint.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/18/23.
//

import Foundation

enum Endpoint {
    
    case home(pagination: Int)
    
    var uri: String {
        switch self {
        case .home(let pagination):
            return "transfer-list/?page=\(pagination)"
        }
    }
}
