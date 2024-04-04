//
//  ContentView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI
import AuthenticationServices


struct ContentView: View {
    
    @State var navigateToNextScreen = false
    @StateObject var signInVM = SignUpViewModel()

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
                    
                    SignInWithAppleButton(.signIn) { request in
                        request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            switch authResults.credential {
                                
                            case let creds as ASAuthorizationAppleIDCredential :
                                let first = creds.fullName?.givenName ?? ""
                                let last = creds.fullName?.familyName ?? ""
                                let fullName = first + " " + last
                                let email = creds.email
                                
                                if let identityTokenData = creds.identityToken {
                                    
                                    print("--------- TOKEN utf8 -------")
                                    let utf8Token = String(data: identityTokenData, encoding: .utf8) ?? ""
                                    print(utf8Token)
                                    print("----------------")
                                    
                                    let userInfo = KeyChainHelper.configureKeyChain(fullName: fullName, email: email)
                                    signInVM.signUpDataObj.email = userInfo.email ?? ""
                                    signInVM.signUpDataObj.name = userInfo.name ?? ""
                                }
                                navigateToNextScreen = true
                                break
                                
                            default:
                                break
                            }
                            print("Authorisation successful")
                        case .failure(let error):
                            print("Authorisation failed: \(error.localizedDescription)")
                            
                        }
                    }
                    .frame(width: 220, height: 55)
                    
//                    Button {
//                        
//                    } label: {
//                        HStack {
//                            Image("googleLogo")
//                            
//                            Text("Continue with Google")
//                                .foregroundStyle(.white)
//                        }
//                        .padding()
//                        .background {
//                            Color.black
//                        }
//                        .cornerRadius(12)
//                        .overlay( /// apply a rounded border
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(Color(.label), lineWidth: 1)
//                        )
//                    }
                }
                .navigationDestination(isPresented: $navigateToNextScreen) {
                    HomeView()
                        .environmentObject(signInVM)
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
