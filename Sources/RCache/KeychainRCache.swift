//
//  KeychainRCache.swift
//  RCache
//
//  Created by Rahmat Trinanda Pramudya Amar on 18/08/24.
//

import Foundation

public class KeychainRCache: RCaching {
    
    private static var _instance: RCaching?
    private static let lock = NSLock()
    
    private var identifier: String = "KeychainCache"
    
    private init(){}
    
    public static var instance: RCaching {
        if _instance == nil {
            lock.lock()
            defer {
                lock.unlock()
            }
            if _instance == nil {
                _instance = KeychainRCache()
            }
        }
        return _instance!
    }
    
    public func save(data: Data, key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: data)
    }
    
    public func save(string: String, key: RCache.Key) {
        if let data = string.data(using: .utf8) {
            RKeychainService.save(key: generate(key), data: data)
        }
    }
    
    public func save(bool: Bool, key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: bool.data as Data)
    }
    
    public func save(integer: Int, key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: integer.data as Data)
    }
    
    public func save(array: [Any], key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: array.data)
    }
    
    public func save(dictionary: [String : Any], key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: dictionary.data)
    }
    
    public func save(double: Double, key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: double.data as Data)
    }
    
    public func save(float: Float, key: RCache.Key) {
        RKeychainService.save(key: generate(key), data: float.data as Data)
    }
    
    public func save<T: Codable>(value: T, key: RCache.Key) throws {
        let data = try JSONEncoder().encode(value)
        RKeychainService.save(key: generate(key), data: data)
    }
    
    public func read<T: Codable>(type: T.Type, key: RCache.Key) throws -> T? {
        guard let data = readData(key: key) else { return nil }
        return try JSONDecoder().decode(type, from: data)
    }
    
    public func readData(key: RCache.Key) -> Data? {
        return RKeychainService.load(key: generate(key))
    }
    
    public func readString(key: RCache.Key) -> String? {
        let data = RKeychainService.load(key: generate(key))
        if let data = data {
            return String(data: data, encoding: .utf8)
        }
        
        return nil
    }
    
    public func readBool(key: RCache.Key) -> Bool? {
        let data = RKeychainService.load(key: generate(key))
        return Bool(data: data as? NSData ?? NSData())
    }
    
    public func readInteger(key: RCache.Key) -> Int? {
        let data = RKeychainService.load(key: generate(key))
        return Int(data: data as? NSData ?? NSData())
    }
    
    public func readArray(key: RCache.Key) -> [Any]? {
        let data = RKeychainService.load(key: generate(key))
        return Array(data: data ?? Data())
    }
    
    public func readDictionary(key: RCache.Key) -> [String : Any]? {
        let data = RKeychainService.load(key: generate(key))
        return Dictionary(data: data ?? Data())
    }
    
    public func readDouble(key: RCache.Key) -> Double? {
        let data = RKeychainService.load(key: generate(key))
        return Double(data: data as? NSData ?? NSData())
    }
    
    public func readFloat(key: RCache.Key) -> Float? {
        let data = RKeychainService.load(key: generate(key))
        return Float(data: data as? NSData ?? NSData())
    }
    
    public func remove(key: RCache.Key) {
        RKeychainService.remove(key: generate(key))
    }
    
    public func clear() {
        let keys = RKeychainService.retrieveKeys()
        keys.forEach { key in
            if key.contains(identifier) {
                RKeychainService.remove(key: key)
            }
        }
    }
}

private extension KeychainRCache {
    private func generate(_ key: RCache.Key) -> String {
        return "\(identifier)-\(key.rawValue)"
    }
}

fileprivate extension Bool {
    var data: NSData {
        var _self = self
        return NSData(bytes: &_self, length: MemoryLayout.size(ofValue: self))
    }
    
    init?(data: NSData) {
        let size = MemoryLayout<Bool>.size
        guard data.length == size else { return nil }
        var value: Bool = false
        data.getBytes(&value, length: size)
        self = value
    }
}

fileprivate extension Int {
    var data: NSData {
        var _self = self
        return NSData(bytes: &_self, length: MemoryLayout.size(ofValue: self))
    }
    
    init?(data: NSData) {
        let size = MemoryLayout<Int>.size
        guard data.length == size else { return nil }
        var value: Int = 0
        data.getBytes(&value, length: size)
        self = value
    }
}

fileprivate extension Array<Any> {
    var data: Data {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            return data
        } catch {
            return Data()
        }
    }
    
    init?(data: Data) {
        do {
            let allowedClasses: [AnyClass] = [NSArray.self, NSNumber.self, NSString.self, NSDictionary.self, NSData.self]
            if let array = try NSKeyedUnarchiver.unarchivedObject(ofClasses: allowedClasses, from: data) as? [Any] {
                self = array
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}

fileprivate extension Dictionary where Key == String, Value == Any {
    var data: Data {
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        return data ?? Data()
    }
    
    init?(data: Data) {
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            self = jsonObject
        } else {
            return nil
        }
    }
}

fileprivate extension Double {
    var data: NSData {
        var _self = self
        return NSData(bytes: &_self, length: MemoryLayout.size(ofValue: self))
    }
    
    init?(data: NSData) {
        let size = MemoryLayout<Double>.size
        guard data.length == size else { return nil }
        var value: Double = 0.0
        data.getBytes(&value, length: size)
        self = value
    }
}

fileprivate extension Float {
    var data: NSData {
        var _self = self
        return NSData(bytes: &_self, length: MemoryLayout.size(ofValue: self))
    }
    
    init?(data: NSData) {
        let size = MemoryLayout<Float>.size
        guard data.length == size else { return nil }
        var value: Float = 0.0
        data.getBytes(&value, length: size)
        self = value
    }
}
