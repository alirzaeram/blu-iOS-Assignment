//
//  Enums.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import Foundation

// Needed enum to represent the HTTP methods. This app will only has one "GET" network call, and I avoid any multiple cases
public enum NetworkHTTPMethodEnum: String {
    case get = "GET"
}

public protocol NetworkSessionProtocol {
    var session: URLSession { get set }
}

public protocol Networking: NetworkSessionProtocol {
    func request<T: Decodable>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}
