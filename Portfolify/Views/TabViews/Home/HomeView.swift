//
//  HomeView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var size = CGSize()
    
    var body: some View {
        TabView {
            NavigationView{
                MainView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            
            NavigationView{
                AddCategoryInfoView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "pencil.and.list.clipboard")
                    Text("Add Info")
                }
            }
            
            NavigationView{
                PortfolioView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "doc")
                    Text("Portfolio")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: -

struct MainView: View {
    @EnvironmentObject var signUpVM: SignUpViewModel
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                NavigationLink {
                    ContentView()
                } label: {
                    Label(
                        title: { Text("Logout") },
                        icon: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 40)
                        }
                    )
                    .labelStyle(.iconOnly)
                    .fontWeight(.medium)
                }
                .padding()
            }
            Spacer()
            
            NavigationLink {
                Terms_ConditionsView()
            } label: {
                Text("Terms & Conditions")
                    .padding(10)
                    .background {
                        Color.primaryBrand
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
                        Color.primaryBrand
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
                        Color.primaryBrand
                    }
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            Spacer()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print(signUpVM.signUpDataObj.email)
        }
    }
}


#Preview {
    HomeView()
}
