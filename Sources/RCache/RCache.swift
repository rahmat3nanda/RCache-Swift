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
