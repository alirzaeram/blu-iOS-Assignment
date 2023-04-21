//
//  AppNetworkManagerTests.swift
//  blu iOS AssignmentTests
//
//  Created by Philip Eram on 4/17/23.
//

import XCTest
@testable import NetworkManger

final class AppNetworkManagerTests: XCTestCase {
    
    var networkManager: AppNetworkManager?

    override func setUpWithError() throws {
        let networking = makeNetworking()
        networkManager = AppNetworkManager()
    }
    
    func testCreateRequest() throws {
        let path = "/users"
        let method = NetworkHTTPMethodEnum.get
        let payload: Encodable? = nil
        let timeout: TimeInterval = 30
        
        if let networkManager = networkManager {
            let request = networkManager.createURL(path: path, method: method, payload: payload, timeout: timeout)
            
            XCTAssertEqual(request.url?.absoluteString, "https://4e6774cc-4d63-41b2-8003-336545c0a86d.mock.pstmn.io/users")
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.timeoutInterval, timeout)
        } else {
            XCTFail("networkManager is nil")
        }
    }
    
    func testCreateRequestWithInvalidEndpoint() throws {
        let path = "/users"
        let method = NetworkHTTPMethodEnum.get
        let payload: Encodable? = nil
        let timeout: TimeInterval = 30
        
        if let networkManager = networkManager {
            XCTAssertThrowsError( networkManager.createURL(path: path, method: method, payload: payload, timeout: timeout)) { error in
                XCTAssertEqual(error as? NetworkError, NetworkError.invalidEndpoint)
            }
        }else {
            XCTFail("networkManager is nil")
        }
    }
    
    
    
}

extension AppNetworkManagerTests {
    private func makeNetworking() -> Networking {
        return Network.init()
    }
    
    private class Network: Networking {
        
        var session: URLSession
        
        init(session: URLSession = .shared) {
            self.session = session
        }
        
        func request<T>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
            completion(.failure(NetworkError.forbidden))
        }
    }
}
