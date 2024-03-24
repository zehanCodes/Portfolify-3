//
//  SignUpView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("Sign Up")
                .bold()
                .font(.largeTitle)
                .fontDesign(.monospaced)

            Spacer()
            
            CustomTextField(fieldTxt: $name, imageName: "person", text: "UserName")
            CustomTextField(fieldTxt: $name, imageName: "envelope", text: "Email")
            CustomTextField(fieldTxt: $name, imageName: "lock", text: "Password")
            
            Spacer()

            NavigationLink {
                HomeView()
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                ContentView()
                            } label: {
                                Label("logout", systemImage: "rectangle.portrait.and.arrow.right")
                                    .labelStyle(.iconOnly)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
            } label: {
                Text("Sign Up")
                    .padding(15)
                    .foregroundColor(.white)
                    .font(.title3)
                    .background {
                        Color(.black)
                    }
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.label), lineWidth: 1)
                    }
            }

            Spacer()
        }
        .background {
//            Color.orange
        }
    }
}


struct CustomTextField: View {
    @Binding var fieldTxt: String
    var imageName: String
    var text: String
    
    var body: some View {
        HStack() {
            Image(systemName: imageName)
                .padding(.leading)
            TextField(text, text: $fieldTxt)
                .padding(.vertical)
        }
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.label), lineWidth: 1)
        )
        .padding(10)
    }
}
#Preview {
    SignUpView()
}
