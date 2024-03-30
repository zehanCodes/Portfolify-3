//
//  AddInfoViewModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 30/03/2024.
//

import SwiftUI

final class AddInfoViewModel: ObservableObject {
    
    @Published var infoItems = CategoryDataModel()
    
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
}


enum Categories: String, CaseIterable {
    case classes = "Classes"
    case testScores  = "Test Scores"
    case awards = "Award/Honors"
    case extraCurricular = "Extracurricular"
    case volunteer = "Volunteer Experience"
    case workExperience = "Work Experience"
}
