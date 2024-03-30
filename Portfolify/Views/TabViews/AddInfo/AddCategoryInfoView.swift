//
//  AddInfoView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct AddCategoryInfoView: View {
    
    @StateObject var accountVM = AddInfoViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .center, spacing: 20, content: {
                ForEach(Categories.allCases, id: \.self) { item in
                    NavigationLink {
                        CategoryDetailsListView(infoItem: accountVM.getDataForCategory(item))
                    } label: {
                        Text("\(item.rawValue)")
                            .frame(width: UIScreen.main.bounds.size.width/2.3 , height: 160)
                            .background {
                                Color.primaryBrand
                            }
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .cornerRadius(20)
                    }
                }
            })
            .padding(.horizontal, 15)
            .task {
                for item in Categories.allCases {
                    accountVM.setTitle(item)
                }
            }
        }
    }
}

#Preview {
    AddCategoryInfoView()
}
