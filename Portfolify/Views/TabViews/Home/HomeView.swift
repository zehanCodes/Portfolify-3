//
//  HomeView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            TabView {
                
                MainView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                
                AddCategoryInfoView()
                    .tabItem {
                        VStack {
                            Image(systemName: "pencil.and.list.clipboard")
                            Text("Add Info")
                        }
                    }
                
                PorfolioView()
                    .tabItem {
                        VStack {
                            Image(systemName: "doc")
                            Text("Portfolio")
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: ContentView()) {
                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                        .labelStyle(.iconOnly)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}


// MARK: -

struct MainView: View {
    @EnvironmentObject var signUpVM: SignUpViewModel
    
    var body: some View {
        //        NavigationStack {
        VStack(spacing: 20) {
            NavigationLink {
                Terms_ConditionsView()
            } label: {
                Text("Terms & Conditions")
                    .padding(10)
                    .background {
                        Color.blue
                    }
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            
            NavigationLink {
                ContactUs()
            } label: {
                Text("Contact Us / Report")
                    .padding(10)
                    .background {
                        Color.blue
                    }
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            NavigationLink {
                ProfileView()
                    .environmentObject(signUpVM)
            } label: {
                Text("Account Info")
                    .padding(10)
                    .background {
                        Color.blue
                    }
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .onAppear {
            print(signUpVM.signUpDataObj.email)
        }
        //        }
    }
}
#Preview {
    HomeView()
}
