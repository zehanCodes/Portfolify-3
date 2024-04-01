//
//  LoginView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var signInVM = SignUpViewModel()
    
    @State private var navigateToNextScreen = false
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Login")
                .bold()
                .font(.largeTitle)
                .fontDesign(.monospaced)

            Spacer()
            
            Group {
                CustomTextField(fieldTxt: $signInVM.signUpDataObj.email, imageName: "envelope", text: "Email")
                HStack() {
                    Image(systemName: "lock")
                        .padding(.leading)
                    SecureField("Password", text: $signInVM.signUpDataObj.password)
                        .lineLimit(5)
                        .padding(.vertical)
                }
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.label), lineWidth: 1)
                )
                .padding(10)
            }
            
            Button(action: {
                if validateSignIn() {
                    navigateToNextScreen = true
                } else {
                    showingAlert = true
                }
            }) {
                Text("Login")
                    .padding(15)
                    .foregroundColor(Color.txt)
                    .font(.title3)
                    .background {
                        Color(.label)
                    }
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.bdr, lineWidth: 1)
                    }
            }
            .navigationDestination(isPresented: $navigateToNextScreen) {
                HomeView()
                    .environmentObject(signInVM)
            }
            Spacer()
        }
        .alert("User not found or Password Incorrect", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func validateSignIn() -> Bool {
        return signInVM.authenticateUserAndLoadData() ? true : false
    }
}

#Preview {
    LoginView()
}
