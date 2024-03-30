//
//  LoginView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("Login")
                .bold()
                .font(.largeTitle)
                .fontDesign(.monospaced)

            Spacer()

            CustomTextField(fieldTxt: $name, imageName: "envelope", text: "Email")
            CustomTextField(fieldTxt: $name, imageName: "lock", text: "Password")
                .padding(.bottom)

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
                Text("Login")
                    .padding(15)
                    .foregroundColor(.white)
                    .font(.title3)
                    .background {
                        Color.black
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

#Preview {
    LoginView()
}
