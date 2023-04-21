//
//  NetworkManagerProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import Foundation

// Protocol for the network manager
public protocol NetworkManagerProtocol {
    var networking: Networking { get set }
    
    func fetchHome(_ pagination: Int, completion: @escaping (Result<[RemoteModel.Home], Error>) -> Void)
}

