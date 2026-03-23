//
//  File.swift
//  
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation
import SystemConfiguration

final class ServiceManager {
    
    private let decoder = JSONDecoder()
    
    private var isReachable: Bool {
        return Reachability.isNetworkReachable()
    }
    
    func request<T: Codable>(_ request: URLRequestConvertible, type: T.Type, completion: @escaping (Result<T?, ServiceError>) -> Void) {
        if isReachable {
            URLSession.shared.dataTask(with: request.urlRequest()) { (data, response, error) in
                if error != nil {
                    completion(.failure(.invalidURLRequest))
                }
                
                if let response = response as? HTTPURLResponse,
                   let data = data {
                    switch response.statusCode {
                    case 200...299:
                        #if DEBUG
                        if let json = String(data: data, encoding: .utf8) {
                            print("[ServiceManager] Raw JSON Response:\n", json)
                        }
                        #endif
                        let decodedData = try? self.decoder.decode(T.self, from: data)
                        completion(.success(decodedData))
                        #if DEBUG
                        print("------\(response.statusCode)------\(request.urlRequest())------\(response.statusCode)------")
                        #endif
                        return
                    case 401:
                        completion(.failure(ServiceError.unauthorized))
                        #if DEBUG
                        print("------\(response.statusCode)------\(request.urlRequest())------\(response.statusCode)------")
                        #endif
                        return
                    case 429:
                        completion(.failure(.rateLimit))
                        #if DEBUG
                        print("------\(response.statusCode)------\(request.urlRequest())------\(response.statusCode)------")
                        #endif
                    default:
                        completion(.failure(ServiceError.invalidResponse))
                        #if DEBUG
                        print("------\(response.statusCode)------\(request.urlRequest())------\(response.statusCode)------")
                        #endif
                        return
                    }
                }
            }.resume()
        } else {
            completion(.failure(.noConnection))
            return
        }
    }
}
