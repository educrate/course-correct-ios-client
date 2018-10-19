//
//  NetworkingClientRequest.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Network Request Protocol

/// used for constructing universal network requests
protocol NetworkingClientRequest {
    
    /// the targets base url
    var baseURL: URL { get }
    
    /// the path to be appended to base url to form the full url
    var path: String { get }
    
    /// the parameters to be appended to the full formed url
    var parameters: [String: String]? { get }
    
    /// the http method used in the request
    var method: NetworkingClientHTTPMethod { get }
    
    /// the headers to be used in the request
    var headers: [String: String]? { get }
    
    /// the body to be used in the request
    var body: NetworkingClientRequestBody? { get }
    
    /// the validation of a request response status codes
    var validation: NetworkingClientValidation { get }
}

// MARK: - Public Constructor
extension NetworkingClientRequest {
    
    /// url request constructed from the object
    var urlRequest: URLRequest {
        
        // construct url request from base url
        var urlRequest = URLRequest(url: baseURL)
        
        // add http method type
        addMethod(method, to: &urlRequest)
        
        // add path to url request
        addPath(path, to: &urlRequest)
        
        // add url components
        addQueryParameters(parameters, to: &urlRequest)
        
        // add headers to url request
        addHeaders(headers, to: &urlRequest)
        
        // add http body
        addRequestBody(body, to: &urlRequest)
        
        return urlRequest
    }
    
    
    /// response returned from network request
    ///
    /// - Parameters:
    ///   - data: information returned from network request
    ///   - urlResponse: response returned from network request
    /// - Returns: constructed networking response
    func response(from data: Data,
                  urlResponse: HTTPURLResponse) -> NetworkingClientResponse {
        
        return NetworkingClientResponse(statusCode: urlResponse.statusCode,
                                        data: data)
    }
}

// MARK: - Private Request Constructor Helpers
private extension NetworkingClientRequest {
    
    /// adds the http method type to the request
    func addMethod(_ method: NetworkingClientHTTPMethod,
                   to request: inout URLRequest) {
        
        request.httpMethod = method.name
    }
    
    /// appends the given path to the request url
    func addPath(_ path: String,
                 to request: inout URLRequest) {
        
        request.url?.appendPathComponent(path)
    }
    
    /// encodes and appends the given request parameters to the request url
    func addQueryParameters(_ parameters: [String: String]?,
                            to request: inout URLRequest) {
        
        guard let parameters = parameters else {
            return
        }
        
        guard let requestURL = request.url else {
            return
        }
        
        let items = parameters.map { URLQueryItem(name: $0, value: $1) }
        
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = items
        
        request.url = urlComponents?.url
    }
    
    /// adds given headers to the request
    func addHeaders(_ headers: [String: String]?,
                    to request: inout URLRequest) {
        guard let headers = headers else {
            return
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    /// adds given body data to the request
    func addRequestBody(_ body: NetworkingClientRequestBody?,
                        to request: inout URLRequest) {
        
        guard let body = body else {
            return
        }
        
        switch body.encoding {
        case .jsonEncoded:
            request.setValue(body.encoding.contentTypeValue,
                             forHTTPHeaderField: NetworkingClientRequestEncodingType.contentTypeKey)
        }
        
        request.httpBody = body.data
    }
}
