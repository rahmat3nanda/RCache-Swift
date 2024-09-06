// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  RCache.swift
//  RCache
//
//  Created by Rahmat Trinanda Pramudya Amar on 18/08/24.
//

import Foundation

/**
 This is a class for managing cache
 */
public class RCache {
    
    private init() {}
    
    /**
     Get a RCaching instance with common level. Used to store RCache for regular data.
     - returns: RCaching
     
     # Notes: #
     1. This instance is an instance of UserDefaultsRCache.
     
     # Example #
     ```
     // RCache.common
     ```
     */
    public class var common: RCaching {
        get {
            return UserDefaultsRCache.instance
        }
    }
    
    /**
     Get a RCaching instance with credentials level. Used to store RCache for credentials data.
     - returns: RCaching
     
     # Notes: #
     1. This instance is an instance of KeychainRCache.
     
     # Example #
     ```
     // RCache.credentials
     ```
     */
    public class var credentials: RCaching {
        get {
            return KeychainRCache.instance
        }
    }
    
    /**
     Method to delete all data for common and credential levels stored via RCache/RCaching.
     # Example #
     ```
     // RCache.clear()
     ```
     */
    public class func clear() {
        common.clear()
        credentials.clear()
    }
}

// MARK: - Key
public extension RCache {
    class Key {
        public var rawValue: String
        
        
        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

// MARK: - Key to String {
internal extension RCache.Key {
    func stringId(_ id: String) -> String {
        let bundleId = Bundle.main.bundleIdentifier ?? ""
        return "\(bundleId)-\(id)-\(rawValue)".replacingOccurrences(of: " ", with: "_")
    }
}
