//
//  PortfolioSectionSubView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 04/04/2024.
//

import SwiftUI

struct PortfolioSectionSubView: View {
    
    @ObservedObject var categoryData: AddCategoryDetailsModel
    
    var body: some View {
        if !categoryData.data.isEmpty {
            VStack(alignment: .leading) {
                Text(categoryData.categoryTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
                Rectangle()
                    .frame(height: 1)
                    .padding(.top, -20)
                
                LazyVStack(alignment: .leading) {
                    ForEach(categoryData.data) { item in
                        HStack(alignment: .center) {
                            Text("•")
                                .font(.title2)
                                .bold()+Text("\(item.title): \(item.details)")
                        }
                    }
                }
                .listStyle(.plain)
            }
//            .frame(width: UIScreen.main.bounds.size.width * 0.6)
        }
    }
}


#Preview {
    PortfolioSectionSubView(categoryData: AddCategoryDetailsModel())
}
