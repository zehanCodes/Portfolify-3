//
//  EditInfoListView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 31/03/2024.
//

import SwiftUI

struct EditInfoListView: View {
    
    @Binding var data: AddInfoSubModel
    
    @ObservedObject var mainCategoryArr: AddCategoryDetailsModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            VStack {
                
                CustomTextField(fieldTxt: $data.title, imageName: "light.ribbon", text: "Enter Title")
                
                CustomTextField(fieldTxt: $data.details, imageName: "info.bubble", text: "Enter \(mainCategoryArr.categoryTitle) Details")
                    .frame(height: 100)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.primaryBrand)
            }
        }
    }
}

#Preview {
    EditInfoListView(data: .constant(AddInfoSubModel()), mainCategoryArr: AddCategoryDetailsModel())
}
