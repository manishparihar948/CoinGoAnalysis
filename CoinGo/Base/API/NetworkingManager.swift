//
//  NetworkingManager.swift
//  CoinGo
//
//  Created by Manish Parihar on 07.11.23.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {}
    
    func request<T: Codable>(_ endpoint:Endpoint,
                             type:T.Type) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        do {
            // Review this section for any potential cancellation
            let (data, response) = try await URLSession.shared.data(for: request)
            // Debug: Print the response status code and received JSON data
            if let httpResponse = response as? HTTPURLResponse {
                    print("Response Status Code: \(httpResponse.statusCode)")
            }

            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON data: \(jsonString)")
            }
            
            // Check if the response status code is within the 2xx range (indicating success)
            guard let response = response as? HTTPURLResponse,
                  (200...299) ~=  response.statusCode else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                throw NetworkingError.invalidStatusCode(statusCode: statusCode)
            }
            
            // Decode the received data using JSONDecoder
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let res = try decoder.decode(T.self, from: data)
            return res
            
        } catch {
            // Handle any errors during the network request, response, or decoding
            print("Error while decoding: \(error)")

            throw NetworkingError.custom(error: error)
        }
    }
}


extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

extension NetworkingManager {
    func buildRequest(from url:URL, methodType:Endpoint.MethodType) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        }
        return request
    }
}
