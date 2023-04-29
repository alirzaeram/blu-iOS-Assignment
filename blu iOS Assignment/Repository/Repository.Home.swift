//
//  Repository.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/25/23.
//

import Foundation
import NetworkManger

extension Repository {
    class Home: AppNetworkManager {
        
        override func baseURL() -> String {
            "346a1dd2-6ee2-48da-bc42-50d4cfb3a6a8.mock.pstmn.io/"
        }
        
        public func fetchHome(_ pagination: Int, completion: @escaping (Result<[Model.Home], Error>) -> Void) {
            let request = self.createURL(path: Endpoint.home(pagination: pagination).uri,
                                         method: .get,
                                         payload: nil, timeout: 10)
            self.networking.request(request, completion: completion)
        }
    }
}
