//
//  AddInfoViewModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 30/03/2024.
//

import SwiftUI

final class AddInfoViewModel: ObservableObject, Codable {
    
    @Published var infoItems = CategoryDataModel()
    
    init () {
        
    }
    
    func getDataForCategory(_ category: Categories) -> AddCategoryDetailsModel {
        switch category {
        case .classes:
            return infoItems.classes
        case .testScores:
            return infoItems.testScores
        case .awards:
            return infoItems.awards
        case .extraCurricular:
            return infoItems.extraCurricular
        case .volunteer:
            return infoItems.volunteer
        case .workExperience:
            return infoItems.workExperience
        }
    }
    
    func setTitle(_ category: Categories) {
        switch category {
        case .classes:
            self.infoItems.classes.categoryTitle = category.rawValue
        case .testScores:
            self.infoItems.testScores.categoryTitle = category.rawValue
        case .awards:
            self.infoItems.awards.categoryTitle = category.rawValue
        case .extraCurricular:
            self.infoItems.extraCurricular.categoryTitle = category.rawValue
        case .volunteer:
            self.infoItems.volunteer.categoryTitle = category.rawValue
        case .workExperience:
            self.infoItems.workExperience.categoryTitle = category.rawValue
        }
    }
    
    enum CodingKeys: String, CodingKey {
            case infoItems
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(infoItems, forKey: .infoItems)
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            infoItems = try container.decode(CategoryDataModel.self, forKey: .infoItems)
        }
}

extension AddInfoViewModel {
    func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: "\(Utilities.shared.getLoggedInUserEmail())AddInfo")
        }
    }
    
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "\(Utilities.shared.getLoggedInUserEmail())AddInfo") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(AddInfoViewModel.self, from: savedData) {
                self.infoItems = loadedData.infoItems
            }
        }
    }
}

enum Categories: String, CaseIterable {
    case classes = "Classes"
    case testScores  = "Test Scores"
    case awards = "Award/Honors"
    case extraCurricular = "Extracurricular"
    case volunteer = "Volunteer Experience"
    case workExperience = "Work Experience"
}
