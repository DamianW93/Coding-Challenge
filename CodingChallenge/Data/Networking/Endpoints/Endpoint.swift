//
//  Endpoint.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 18/04/2022.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var requestTimeOut: Double { get }
    
    func buildRequest() -> URLRequest
}

extension Endpoint {
    var baseURL: URL {
        URL(string: NetworkConstants.apiUrl)!
    }
    
    var headers: [String: String] {
        [
            NetworkConstants.acceptHeader: NetworkConstants.acceptHeaderValue,
            NetworkConstants.contentTypeHeader: NetworkConstants.contentTypeHeaderValue
        ]
    }
    
    var requestTimeOut: Double {
        60.0
    }
    
    func buildRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        
        switch method {
        case .get(let queryItems):
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = queryItems
        case .post(let data), .put(let data):
            urlRequest.httpBody = data
        default: break
        }
        
        urlRequest.httpMethod = method.name
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}
