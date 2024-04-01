//
//  SignUpViewModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 01/04/2024.
//

import SwiftUI

class SignUpViewModel: ObservableObject, Codable {
    
    @Published var signUpDataObj = SignUpModel()
    
    var isButtonEnabled : Bool {
        !signUpDataObj.name.isEmpty && !signUpDataObj.password.isEmpty && !signUpDataObj.email.isEmpty && !signUpDataObj.highSchool.isEmpty && !signUpDataObj.cgpa.isEmpty && !signUpDataObj.graduationYear.isEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case signUpDataObj
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        signUpDataObj = try values.decode(SignUpModel.self, forKey: .signUpDataObj)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(signUpDataObj, forKey: .signUpDataObj)
    }
}

extension SignUpViewModel {
    func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: "\(signUpDataObj.email)")
        }
    }
    
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "\(signUpDataObj.email)") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(SignUpViewModel.self, from: savedData) {
                self.signUpDataObj = loadedData.signUpDataObj
            }
        }
    }
    
    
    func isUserFound() -> Bool{
        if let savedData = UserDefaults.standard.data(forKey: "\(signUpDataObj.email)") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(SignUpViewModel.self, from: savedData) {
                return true
            }
        }
        return false
    }
    
    func validateSignUp() -> Bool {
        return isButtonEnabled ? true : false
    }
}

//MARK: - SignIn Methods

extension SignUpViewModel {
    func authenticateUserAndLoadData() -> Bool {
        if let savedData = UserDefaults.standard.data(forKey: "\(signUpDataObj.email)") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(SignUpViewModel.self, from: savedData) {
                if self.signUpDataObj.password == loadedData.signUpDataObj.password {
                    self.signUpDataObj = loadedData.signUpDataObj
                    return true
                }
            }
        }
        return false
    }
}
