//
//  AppNetworkManager.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import Foundation

// Class to manage the network requests
public class AppNetworkManager: NetworkManagerProtocol {
    
    public var networking: Networking
    private let queue = DispatchQueue(label: "com.blu.networkManager", attributes: .concurrent)
    
    public init() {
        self.networking = URLSessionNetworking.init()
    }
    
    // Method to create a URLRequest object
    internal func createURL(path: String, method: NetworkHTTPMethodEnum, payload: Encodable?, timeout: TimeInterval) -> URLRequest {
        // Create the URL from the URL components
        guard let url: URL = .init(string: "\(endPointProtocol())://\(baseURL())\(path)") else {
            fatalError()
        }
        
        // Create the URLRequest object
        var request = URLRequest(url: url, cachePolicy: networking.session.configuration.requestCachePolicy, timeoutInterval: timeout)
        request.httpMethod = method.rawValue // Set the HTTP method
        
        return request
    }
    
    // Method to return the endpoint protocol
    func endPointProtocol() -> String { "https" }
    
    // Method to return the baseURL
    func baseURL() -> String {
        "4e6774cc-4d63-41b2-8003-336545c0a86d.mock.pstmn.io/"
    }
}

