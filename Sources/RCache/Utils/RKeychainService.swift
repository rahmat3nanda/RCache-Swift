//
//  RKeychainService.swift
//  RCache
//
//  Created by Rahmat Trinanda Pramudya Amar on 18/08/24.
//

import Foundation

public class RKeychainService {
    public class func save(key: String, data: Data) {
        let query: [String : Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        SecItemAdd(query as CFDictionary, nil)
    }
    
    public class func load(key: String) -> Data? {
        let query: [String : Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne ]
        
        var dataTypeRef: AnyObject? = nil
        
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
    
    public class func remove(key: String) {
        let query: [String : Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key] as [String : Any]
        
        SecItemDelete(query as CFDictionary)
    }
    
    public class func clear()  {
        let secItemClasses =  [
            kSecClassGenericPassword,
            kSecClassInternetPassword,
            kSecClassCertificate,
            kSecClassKey,
            kSecClassIdentity,
        ]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
    
    public class func retrieveKeys() -> [String] {
        var data: [String] = []
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitAll,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            if let items = result as? [[String: Any]] {
                for item in items {
                    if let account = item[kSecAttrAccount as String] as? String {
                        data.append(account)
                    }
                }
            } else {
                print("No items found in the keychain with kSecAttrAccount attribute.")
            }
        } else if status == errSecItemNotFound {
            print("No matching items found in the keychain.")
        } else {
            print("Keychain retrieval error: \(status)")
        }
        
        return data
    }
}
