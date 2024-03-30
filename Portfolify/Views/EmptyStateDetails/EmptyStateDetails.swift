//
//  EmptyStateDetails.swift
//  Portfolify
//
//  Created by Ali Tamoor on 31/03/2024.
//

import SwiftUI

struct EmptyStateDetails: View {
    
    var imageName: String
    var message: String
    
    init(imageName: String = "empty-order", message: String = "Default Message") {
        self.imageName = imageName
        self.message = message
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
        
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                
                Text(message)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyStateDetails()
}
