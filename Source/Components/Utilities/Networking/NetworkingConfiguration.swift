//
//  NetworkingConfiguration.swift
//  Client
//
//  Created by Christian Ampe on 8/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Configuration Declaration
extension Networking {
    
    /// configuration for network pathways
    struct Configuration {
        
        /// base url for all networking requests
        let baseURL: URL
        
        /// path to `/hassubscription`
        let hasSubscriptionPath: String
        
        /// path to `/addsubscription`
        let addSubscriptionPath: String
        
        /// configuration initializer
        init(baseURL: URL,
                    hasSubscriptionPath: String,
                    addSubscriptionPath: String) {
            
            self.baseURL = baseURL
            self.hasSubscriptionPath = hasSubscriptionPath
            self.addSubscriptionPath = addSubscriptionPath
        }
    }
}
