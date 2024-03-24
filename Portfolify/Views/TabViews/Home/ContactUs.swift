//
//  ContactUs.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct ContactUs: View {
    var body: some View {
        VStack {
            Text("Contact Us")
                .font(.title)
                .bold()
                .fontDesign(.monospaced)
                
            Text("In case of any queries or issues we can be contacted through following details: ")
                .font(.body)
                .padding(.vertical, 20)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Email: ")
                    Text("dummy@gmail.com")
                }
                
                HStack {
                    Text("Phone # : ")
                    Text("0172229021")
                }
            }
            
            Spacer()
            
            Text("© 2024 Portfolify. All rights reserved.")
                .font(.caption)
                .fontDesign(.monospaced)
        }
        .padding()
    }
}

#Preview {
    ContactUs()
}
