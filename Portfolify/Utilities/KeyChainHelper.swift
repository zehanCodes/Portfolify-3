//
//  KeyChainHelper.swift
//  Portfolify
//
//  Created by Ali Tamoor on 05/04/2024.
//

import Foundation

class KeyChainHelper {
    
    static func configureKeyChain(fullName: String, email: String?) -> UserInformation {
        if !fullName.isEmpty {
            let _ = KeyChainHelper.storeData(data: fullName, service: SignWithAppleConstants.service, account: SignWithAppleConstants.accountForName)
        }
        
        if let email = email {
            let _ = KeyChainHelper.storeData(data: email, service: SignWithAppleConstants.service, account: SignWithAppleConstants.accountForEmail)
        }
        
        let fullNameKC = KeyChainHelper.retrieveData(service: SignWithAppleConstants.service, account: SignWithAppleConstants.accountForName)
        let emailKC = KeyChainHelper.retrieveData(service: SignWithAppleConstants.service, account: SignWithAppleConstants.accountForEmail)
        
        return UserInformation(name: fullNameKC, email: emailKC)
    }
    
    static func storeData(data: String, service: String, account: String) -> Bool {
        let formattedData = data.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: formattedData
        ]
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    static func retrieveData(service: String, account: String) -> String? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess, let data = item as? Data {
            let data = String(data: data, encoding: .utf8)
            print(data ?? "N/A")
            return data
        } else {
            print("Error retrieving from Keychain: \(status)")
            return nil
        }
    }
}
