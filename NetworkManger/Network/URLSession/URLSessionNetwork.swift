//
//  Enums.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import Foundation

// MARK: This final class can help prevent unintended side effects from overriding its methods or properties.
final class URLSessionNetworking: Networking {
    
    var session: URLSession
    
    // MARK: Can help prevent race conditions when multiple threads access the same instance of the class. To ensure that the completion handler is called in a thread-safe manner.
    private let lock = NSLock()
    
    // MARK: .shared by default, This allows to create instances of the class without having to provide a custom URLSession object, which is usually unnecessary
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: Expecting only JSON data, duo to Generic T and not Data
    func request<T: Decodable>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let _ = request.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            self.lock.lock()
            
            defer {
                self.lock.unlock()
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data else {
                    completion(.failure(NetworkError.invalidData))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case 400:
                completion(.failure(NetworkError.badRequest))
                
            case 401:
                completion(.failure(NetworkError.unauthorized))
                
            case 403:
                completion(.failure(NetworkError.forbidden))
                
            case 404:
                completion(.failure(NetworkError.notFound))
                
            case 500:
                completion(.failure(NetworkError.internalServerError))
                
            default:
                completion(.failure(NetworkError.httpError(httpResponse.statusCode)))
            }
            
        }
        
        task.resume()
    }
    
}
