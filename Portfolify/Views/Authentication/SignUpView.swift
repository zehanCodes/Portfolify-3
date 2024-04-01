//
//  SignUpView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var signUpVM = SignUpViewModel()
    @State private var navigateToNextScreen = false
    @State private var showingAlert: Bool = false
    @State private var temp: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Sign Up")
                    .bold()
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                
                Spacer()
                
                Group {
                    CustomTextField(fieldTxt: $signUpVM.signUpDataObj.name, imageName: "person", text: "User Name")
                    CustomTextField(fieldTxt: $signUpVM.signUpDataObj.email, imageName: "envelope", text: "Email")
                        .keyboardType(.emailAddress)
                    
                    HStack() {
                        Image(systemName: "lock")
                            .padding(.leading)
                        SecureField("Password", text: $signUpVM.signUpDataObj.password)
                            .lineLimit(5)
                            .padding(.vertical)
                    }
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.label), lineWidth: 1)
                    )
                    .padding(10)
                    
                    CustomTextField(fieldTxt: $signUpVM.signUpDataObj.highSchool, imageName: "building.columns", text: "High School")
                    CustomTextField(fieldTxt: $signUpVM.signUpDataObj.cgpa, imageName: "number", text: "CGPA")
                    CustomTextField(fieldTxt: $signUpVM.signUpDataObj.graduationYear, imageName: "graduationcap.fill", text: "Graduation Year")
                }
                
                Spacer()
                
                Button(action: {
                    if !signUpVM.isUserFound() {
                        signUpVM.saveData()
                        navigateToNextScreen = true
                    } else {
                        showingAlert = true
                    }
                }) {
                    Text("Sign Up")
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
                .disabled(!signUpVM.validateSignUp())
                .opacity(signUpVM.validateSignUp() ? 1 : 0.5)
                .navigationDestination(isPresented: $navigateToNextScreen) {
                    HomeView()
                        .environmentObject(signUpVM)
                }
                Spacer()
            }
        }
        .alert("User Already Registered!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
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
            TextField(text, text: $fieldTxt, axis: .vertical)
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
}
#Preview {
    SignUpView()
}
