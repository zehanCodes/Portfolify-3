//
//  LeftSideViewPorfolio.swift
//  Portfolify
//
//  Created by Ali Tamoor on 04/04/2024.
//

import SwiftUI

struct LeftSideViewPorfolio: View {
    @EnvironmentObject var signUpVM: SignUpViewModel

    var body: some View {
        VStack(alignment: .center) {
            VStack {
                if let data = signUpVM.signUpDataObj.imageData, let img = UIImage(data: data) {
                    Image(uiImage: img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
            }.padding(.vertical)
            
            Group {
                VStack(alignment: .leading) {
                    Text("Contact")
                        .font(.title2)
                        .italic()
                        .fontWeight(.heavy)
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top, -10)

                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                        
                        Text(signUpVM.signUpDataObj.email)
                            .padding(.leading, 5)
                            .font(.body)
                            .fontWeight(.regular)
                    }
                    .padding(.bottom, 20)
                }
                
                VStack(alignment: .leading) {
                    Text("Education")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .italic()
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top, -10)

                    Group {
                        VStack(alignment: .leading) {
                            Text("High School")
                                .font(.headline)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            
                            Text(signUpVM.signUpDataObj.highSchool)
                                .padding(.leading, 5)
                                .font(.body)
                                .fontWeight(.regular)
                        }
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading) {
                            Text("Gradution Year")
                                .font(.headline)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            
                            Text(signUpVM.signUpDataObj.graduationYear)
                                .padding(.leading, 5)
                                .font(.body)
                                .fontWeight(.regular)
                            
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 5)
            Spacer()
        }
        .onAppear {
            signUpVM.loadData()
        }
        .background {
            Color.portfolio
        }
        .foregroundStyle(Color.white)
//        .padding(.horizontal)
    }
}


//#Preview {
//    LeftSideViewPorfolio()
//}
