//
//  Utilities.swift
//  Portfolify
//
//  Created by Ali Tamoor on 04/04/2024.
//

import Foundation
class Utilities {
    
    static let shared = Utilities()
    private var email = ""
    
    private init() {}
    
    func getLoggedInUserEmail() -> String {
        email
    }
    
    func setLoggedInUserEmail(email: String) {
        self.email = email
    }
}
