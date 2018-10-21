//
//  NetworkingCache.swift
//  Client
//
//  Created by Christian Ampe on 9/17/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

// MARK: - Networking Cache Structure
class NetworkingCache {
    
    /// cache storage
    private var cache: [String: Any] = [:]
}

// MARK: - Internal Cache Methods
extension NetworkingCache {
    
    /// only access point for adding values to the cache
    /// this method should only be used for successful responses
    /// with fully parsed models
    /// - Parameters:
    ///     - service: associated endpoint we are caching
    ///     - value: result of the network call we are caching
    func updateCache(for service: Networking.Service, with value: Any) {
        cache[service.cacheKey] = value
    }
    
    /// only access point for retrieving cache
    /// - Parameters:
    ///     - service: associated endpoint we are caching
    func extractCache(for service: Networking.Service) -> Any? {
        return cache[service.cacheKey]
    }
    
    /// clears out all cached network requests
    func clearCache() {
        cache = [:]
    }
}
