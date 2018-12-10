//
//  AddLocationNetworking.swift
//  Client
//
//  Created by Ampe on 12/9/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum AddLocationNetworking: NetworkingRequest {
    case autocomplete(String)
    case test
}

extension AddLocationNetworking {
    var baseURL: URL {
        switch self {
        case .autocomplete:
            return URL(string: "baseurl")!
        case .test:
            return URL(string: "test")!
        }
    }
    
    var path: String {
        switch self {
        case .autocomplete:
            return "/autocomplete"
        case .test:
            return "/test"
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case .autocomplete:
            return nil
        case .test:
            return nil
        }
    }
    
    var method: NetworkingRequestHTTPMethod {
        switch self {
        case .autocomplete:
            return .get
        case .test:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .autocomplete:
            return nil
        case .test:
            return nil
        }
    }
    
    var body: NetworkingRequestBody? {
        switch self {
        case .autocomplete:
            return nil
        case .test:
            return nil
        }
    }
    
    var validation: NetworkingRequestValidation {
        switch self {
        case .autocomplete:
            return .successCodes
        case .test:
            return .successCodes
        }
    }
}
