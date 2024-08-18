//
//  RCaching.swift
//  RCache
//
//  Created by Rahmat Trinanda Pramudya Amar on 18/08/24.
//

import Foundation

/**
 Is a protocol for RCache.
 */
public protocol RCaching {
    
    
    /**
     Gets an instance of RCaching
     - returns: RCaching
     # Example #
     ```
     // RCaching.instance
     ```
     */
    static var instance: RCaching { get }
    
    /**
     Method for storing Data with a defined key.
     
     - parameter data: Data.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(data: Data(), key: RCache.Key("data"))
     ```
     */
    func save(data: Data, key: RCache.Key)
    
    /**
     Method for storing Data with a defined key.
     
     - parameter data: T.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(value: Codable, key: {key})
     ```
     */
    func save<T: Codable>(value: T, key: RCache.Key) throws
    
    /**
     Method for storing String with a defined key.
     
     - parameter data: String.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(string: "data string", key: RCache.Key("string"))
     ```
     */
    func save(string: String, key: RCache.Key)
    
    /**
     Method for storing Boolean with a defined key.
     
     - parameter bool: Bool.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(bool: true, key: RCache.Key("bool"))
     ```
     */
    func save(bool: Bool, key: RCache.Key)
    
    /**
     Method for storing Integer with a defined key.
     
     - parameter integer: Int.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(integer: 101, key: RCache.Key("integer"))
     ```
     */
    func save(integer: Int, key: RCache.Key)
    
    /**
     Method for storing Array with a defined key.
     
     - parameter array: [Any].
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(array: [101, "string", true], key: RCache.Key("array"))
     ```
     */
    func save(array: [Any], key: RCache.Key)
    
    /**
     Method for storing Dictionary<String, Any> with a defined key.
     
     - parameter dictionary: [String: Any].
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(dictionary: ["bool": true, "integer": 101], key: RCache.Key("dictionary"))
     ```
     */
    func save(dictionary: [String: Any], key: RCache.Key)
    
    /**
     Method for storing Double with a defined key.
     
     - parameter double: Double.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(double: 2.0, key: RCache.Key("double"))
     ```
     */
    func save(double: Double, key: RCache.Key)
    
    /**
     Method for storing Float with a defined key.
     
     - parameter float: Float.
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.save(float: 3.01, key: RCache.Key("float"))
     ```
     */
    func save(float: Float, key: RCache.Key)
    
    /**
     Method for getting Data with a defined key
     - parameter key: RCache.Key.
     - returns: T?
     
     # Example #
     ```
     // RCaching.instance.readData(type: Codable.self, key: RCache.Key("data"))
     ```
     */
    func read<T: Codable>(type: T.Type, key: RCache.Key) throws -> T?
    
    /**
     Method for getting Data with a defined key
     - parameter key: RCache.Key.
     - returns: Data?
     
     # Example #
     ```
     // RCaching.instance.readData(key: RCache.Key("data"))
     ```
     */
    func readData(key: RCache.Key) -> Data?
    
    /**
     Method for getting String with a defined key
     - parameter key: RCache.Key.
     - returns: String?
     
     # Example #
     ```
     // RCaching.instance.readString(key: RCache.Key("string"))
     ```
     */
    func readString(key: RCache.Key) -> String?
    
    /**
     Method for getting Bool with a defined key
     - parameter key: RCache.Key.
     - returns: Bool?
     
     # Example #
     ```
     // RCaching.instance.readBool(key: RCache.Key("bool"))
     ```
     */
    func readBool(key: RCache.Key) -> Bool?
    
    /**
     Method for getting Integer with a defined key
     - parameter key: RCache.Key.
     - returns: Int?
     
     # Example #
     ```
     // RCaching.instance.readInteger(key: RCache.Key("integer"))
     ```
     */
    func readInteger(key: RCache.Key) -> Int?
    
    /**
     Method for getting Array with a defined key
     - parameter key: RCache.Key.
     - returns: [Any]?
     
     # Example #
     ```
     // RCaching.instance.readArray(key: RCache.Key("array"))
     ```
     */
    func readArray(key: RCache.Key) -> [Any]?
    
    /**
     Method for getting Dictionary<String: Any> with a defined key
     - parameter key: RCache.Key.
     - returns: [String: Any]?
     
     # Example #
     ```
     // RCaching.instance.readDictionary(key: RCache.Key("dictionary"))
     ```
     */
    func readDictionary(key: RCache.Key) -> [String: Any]?
    
    /**
     Method for getting Double with a defined key
     - parameter key: RCache.Key.
     - returns: Double?
     
     # Example #
     ```
     // RCaching.instance.readDouble(key: RCache.Key("double"))
     ```
     */
    func readDouble(key: RCache.Key) -> Double?
    
    /**
     Method for getting Float with a defined key
     - parameter key: RCache.Key.
     - returns: Float?
     
     # Example #
     ```
     // RCaching.instance.readFloat(key: RCache.Key("float"))
     ```
     */
    func readFloat(key: RCache.Key) -> Float?
    
    
    /**
     Method for deleting data stored with a defined key
     - parameter key: RCache.Key.
     
     # Example #
     ```
     // RCaching.instance.remove(key: RCache.Key("dictionary"))
     ```
     */
    func remove(key: RCache.Key)
    
    /**
     Method for deleting all data stored via Caching with a defined key
     
     # Example #
     ```
     // RCaching.instance.clear()
     ```
     */
    func clear()
}
