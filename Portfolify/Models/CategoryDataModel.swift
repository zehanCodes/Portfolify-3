//
//  CategoryDataModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 30/03/2024.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

class CategoryDataModel: Identifiable, ObservableObject, Codable {
    @Published var id: Int = UUID().hashValue
    @Published var classes = AddCategoryDetailsModel()
    @Published var testScores = AddCategoryDetailsModel()
    @Published var awards = AddCategoryDetailsModel()
    @Published var extraCurricular = AddCategoryDetailsModel()
    @Published var volunteer = AddCategoryDetailsModel()
    @Published var workExperience = AddCategoryDetailsModel()
    
    
    init () {
        
    }
    // Coding keys for CategoryDataModel
    enum CodingKeys: String, CodingKey {
        case id, classes, testScores, awards, extraCurricular, volunteer, workExperience
    }
    
    // Codable init(from:) method
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        classes = try container.decode(AddCategoryDetailsModel.self, forKey: .classes)
        testScores = try container.decode(AddCategoryDetailsModel.self, forKey: .testScores)
        awards = try container.decode(AddCategoryDetailsModel.self, forKey: .awards)
        extraCurricular = try container.decode(AddCategoryDetailsModel.self, forKey: .extraCurricular)
        volunteer = try container.decode(AddCategoryDetailsModel.self, forKey: .volunteer)
        workExperience = try container.decode(AddCategoryDetailsModel.self, forKey: .workExperience)
    }
    
    // Codable encode(to:) method
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(classes, forKey: .classes)
        try container.encode(testScores, forKey: .testScores)
        try container.encode(awards, forKey: .awards)
        try container.encode(extraCurricular, forKey: .extraCurricular)
        try container.encode(volunteer, forKey: .volunteer)
        try container.encode(workExperience, forKey: .workExperience)
    }
}

class AddCategoryDetailsModel: ObservableObject, Codable {
    @Published var categoryTitle: String = ""
    @Published var data: [AddInfoSubModel] = []
    
    enum CodingKeys: String, CodingKey {
        case categoryTitle, data
    }
    
    init () {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categoryTitle = try container.decode(String.self, forKey: .categoryTitle)
        data = try container.decode([AddInfoSubModel].self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(categoryTitle, forKey: .categoryTitle)
        try container.encode(data, forKey: .data)
    }
}

class AddInfoSubModel: Identifiable, Hashable, ObservableObject, Codable {
    @Published var id = UUID()
    @Published var title: String = ""
    @Published var details: String = ""
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Equatable
    static func == (lhs: AddInfoSubModel, rhs: AddInfoSubModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    // MARK: - Codable Conformance
    
    init () {}
    
    enum CodingKeys: String, CodingKey {
        case id, title, details
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        details = try container.decode(String.self, forKey: .details)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(details, forKey: .details)
    }
}

