//
//  CategoryDataModel.swift
//  Portfolify
//
//  Created by Ali Tamoor on 30/03/2024.
//

import Foundation
import SwiftUI

class CategoryDataModel: Identifiable, ObservableObject {
    @Published var id: Int = UUID().hashValue
    @Published var classes = AddCategoryDetailsModel()
    @Published var testScores = AddCategoryDetailsModel()
    @Published var awards = AddCategoryDetailsModel()
    @Published var extraCurricular = AddCategoryDetailsModel()
    @Published var volunteer = AddCategoryDetailsModel()
    @Published var workExperience = AddCategoryDetailsModel()
}

class AddCategoryDetailsModel: ObservableObject {
    @Published var categoryTitle: String = ""
    @Published var data: [AddInfoSubModel] = []
}

class AddInfoSubModel: Identifiable, Hashable, ObservableObject {
    
    @Published var title: String = ""
    @Published var details: String = ""
    
    static func == (lhs: AddInfoSubModel, rhs: AddInfoSubModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
