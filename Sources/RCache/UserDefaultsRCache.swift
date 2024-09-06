//
//  UserDefaultsRCache.swift
//  RCache
//
//  Created by Rahmat Trinanda Pramudya Amar on 18/08/24.
//

import Foundation

public class UserDefaultsRCache: RCaching {
    
    private static var _instance: RCaching?
    private static let lock = NSLock()
    
    private var defaults: UserDefaults = UserDefaults.standard
    private var identifier: String = "UserDefaultsRCache"
    
    private init(){}
    
    public static var instance: RCaching {
        if _instance == nil {
            lock.lock()
            defer {
                lock.unlock()
            }
            if _instance == nil {
                _instance = UserDefaultsRCache()
            }
        }
        return _instance!
    }
    
    public func save(data: Data, key: RCache.Key) {
        defaults.set(data, forKey: generate(key))
    }
    
    public func save(string: String, key: RCache.Key) {
        defaults.set(string, forKey: generate(key))
    }
    
    public func save(bool: Bool, key: RCache.Key) {
        defaults.set(bool, forKey: generate(key))
    }
    
    public func save(integer: Int, key: RCache.Key) {
        defaults.set(integer, forKey: generate(key))
    }
    
    public func save(array: [Any], key: RCache.Key) {
        defaults.set(array, forKey: generate(key))
    }
    
    public func save(dictionary: [String : Any], key: RCache.Key) {
        defaults.set(dictionary, forKey: generate(key))
    }
    
    public func save(double: Double, key: RCache.Key) {
        defaults.set(double, forKey: generate(key))
    }
    
    public func save(float: Float, key: RCache.Key) {
        defaults.set(float, forKey: generate(key))
    }
    
    public func readData(key: RCache.Key) -> Data? {
        return defaults.data(forKey: generate(key))
    }
    
    public func readString(key: RCache.Key) -> String? {
        return defaults.string(forKey: generate(key))
    }
    
    public func save<T: Codable>(value: T, key: RCache.Key) throws {
        let data = try JSONEncoder().encode(value)
        defaults.set(data, forKey: generate(key))
    }
    
    public func read<T:Codable>(type: T.Type, key: RCache.Key) throws -> T? {
        guard let data = readData(key: key) else { return nil }
        return try JSONDecoder().decode(type, from: data)
    }
    
    public func readBool(key: RCache.Key) -> Bool? {
        return defaults.bool(forKey: generate(key))
    }
    
    public func readInteger(key: RCache.Key) -> Int? {
        return defaults.integer(forKey: generate(key))
    }
    
    public func readArray(key: RCache.Key) -> [Any]? {
        return defaults.array(forKey: generate(key))
    }
    
    public func readDictionary(key: RCache.Key) -> [String : Any]? {
        return defaults.dictionary(forKey: generate(key))
    }
    
    public func readDouble(key: RCache.Key) -> Double? {
        return defaults.double(forKey: generate(key))
    }
    
    public func readFloat(key: RCache.Key) -> Float? {
        return defaults.float(forKey: generate(key))
    }
    
    public func remove(key: RCache.Key) {
        defaults.removeObject(forKey: generate(key))
    }
    
    public func clear() {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            if key.contains(identifier) {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

private extension UserDefaultsRCache {
    private func generate(_ key: RCache.Key) -> String {
        return key.stringId(identifier)
    }
}

