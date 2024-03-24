//
//  ProfileView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Biogragphy")
                .font(.title)
                .bold()
                .fontDesign(.monospaced)
            
            Circle()
                .foregroundColor(.clear)
                .frame(height: 100)
                .background {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                .overlay {
                    Circle()
                        .stroke(Color(.label), lineWidth: 1.5)
                }
                .padding(.top)
                
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam magna diam, ornare eget iaculis id, sagittis ut lectus. Donec sit amet mauris ac ligula elementum interdum. Ut id turpis vel ex viverra mattis. Vestibulum a elit imperdiet tellus tempus auctor ut id mauris.Nam magna diam, ornare eget iaculis id, sagittis ut lectus. Donec sit amet mauris ac ligula elementum interdum. Ut id turpis vel ex viverra mattis. Vestibulum a elit imperdiet tellus tempus auctor ut id mauris. Integer nisi sapien, elementum eu metus et, dictum finibus odio. Interdum Donec finibus nisi eu dui condimentum luctus.")
                .multilineTextAlignment(.center)
                .font(.callout)
                .padding(.vertical)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
