//
//  NetworkingService.swift
//  Client
//
//  Created by Christian Ampe on 8/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Networking Services
extension Networking {
    
    /// service enum holding references to network pathways
    enum Service: NetworkingClientRequest {
        case welcomeScreen
    }
}

// MARK: - Stored Properties
extension Networking.Service {
    
    /// configuration which defaults at initialization
    /// to avoid an unusable networking layer
    /// property to be set at the init of the network class
    /// this property will always be set on initialization
    /// ensure this property is never set to nil
    static var configuration: Networking.Configuration!
}

// MARK: - Computed Routes
extension Networking.Service {
    
    /// base url of this service
    var baseURL: URL {
        return Networking.Service.configuration.baseURL
    }
    
    /// routes for the different service pathways
    var path: String {
        return ""
    }
    
    /// parameters to be added to the url request
    var parameters: [String: String]? {
        return nil
    }
}

// MARK: - Computed Network Request Parameters
extension Networking.Service {
    
    /// methods for the different service pathways
    var method: NetworkingClientHTTPMethod {
        return .get
    }
    
    // parameters to be passed in the network requests
    var body: NetworkingClientRequestBody? {
       return nil
    }
    
    /// headers to be passed in the network request
    var headers: [String: String]? {
        return nil
    }
}

// MARK: - Post Response Validation
extension Networking.Service {
    var validation: NetworkingClientValidation {
        return .successCodes
    }
}

// MARK: - Internal Computed Properties
extension Networking.Service {
    
    /// keys used to extract cached successful network responses
    var cacheKey: String {
        return ""
    }
}
