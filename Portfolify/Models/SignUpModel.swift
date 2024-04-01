//
//  SignUpModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 01/04/2024.
//

import SwiftUI

import SwiftUI

class SignUpModel: Identifiable, ObservableObject, Codable {
    @Published var id: Int = UUID().hashValue
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var highSchool: String = ""
    @Published var cgpa: String = ""
    @Published var graduationYear: String = ""
    @Published var imageData: Data? // Optional image data property
    
    init() {}
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case password = "password"
        case highSchool = "highSchool"
        case cgpa = "cgpa"
        case graduationYear = "graduationYear"
        case imageData = "imageData" // Include image data in CodingKeys
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        highSchool = try values.decode(String.self, forKey: .highSchool)
        cgpa = try values.decode(String.self, forKey: .cgpa)
        graduationYear = try values.decode(String.self, forKey: .graduationYear)
        imageData = try values.decodeIfPresent(Data.self, forKey: .imageData) // Decode image data if present
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(highSchool, forKey: .highSchool)
        try container.encode(cgpa, forKey: .cgpa)
        try container.encode(graduationYear, forKey: .graduationYear)
        try container.encodeIfPresent(imageData, forKey: .imageData) // Encode image data if present
    }
}
