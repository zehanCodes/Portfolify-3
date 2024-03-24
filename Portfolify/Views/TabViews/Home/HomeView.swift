//
//  HomeView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            
            MainView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            AddInfoView()
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
}


// MARK: -

struct MainView: View {
    var body: some View {
        NavigationStack {
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
        }
    }
}
#Preview {
    HomeView()
}
