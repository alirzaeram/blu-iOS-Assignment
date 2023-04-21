//
//  AppNetwrokRequest.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/18/23.
//

import Foundation

extension AppNetworkManager {
    
    public func fetchHome(_ pagination: Int, completion: @escaping (Result<[RemoteModel.Home], Error>) -> Void) {
        let request = self.createURL(path: Endpoint.home(pagination: pagination).uri,
                                     method: .get,
                                     payload: nil, timeout: 10)
        self.networking.request(request, completion: completion)
    }
}
