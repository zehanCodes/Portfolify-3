//
//  ContentView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Portfolify")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.monospaced)
                        .padding(.bottom, 70)
                    //                        .underline()
                }
                Spacer()
                HStack(spacing: 25) {
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack {
                            Text("Log In")
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .padding()
                        .background {
                            Color.primaryBrand
                        }
                        .cornerRadius(12)
                    }
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        HStack {
                            Text("Sign Up")
                                .foregroundStyle(.black)
                                .bold()
                        }
                        .padding()
                        .background {
                            Color.white
                        }
                        .cornerRadius(12)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 1)
                        )
                    }
                }
                
                Rectangle()
                    .frame(width: 140, height: 1)
                    .padding(.vertical, 25)
                
                VStack(spacing: 15) {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("appleLogo")
                                .colorInvert()
                            Text("Continue with Apple")
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(12)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.label), lineWidth: 1)
                        )
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image("googleLogo")
                            
                            Text("Continue with Google")
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background {
                            Color.black
                        }
                        .cornerRadius(12)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.label), lineWidth: 1)
                        )
                    }
                }
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
