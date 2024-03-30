//
//  ProfileView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 1
    
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
                        if vm.images.isEmpty {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 60, height: 60)
                        } else {
                            Image(uiImage: vm.images[0])
                                .resizable()
//                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                    }
                    .overlay {
                        ZStack(alignment: .bottomTrailing) {
                            Circle()
                                .stroke(Color(.label), lineWidth: 1.5)
                            PhotosPicker(
                                selection: $vm.selectedPhotos, // holds the selected photos from the picker
                                maxSelectionCount: maxPhotosToSelect, // sets the max number of photos the user can select
                                selectionBehavior: .ordered, // ensures we get the photos in the same order that the user selected them
                                matching: .images // filter the photos library to only show images
                            ) {
                                // this label changes the text of photo to match either the plural or singular case based on the value in maxPhotosToSelect
                                
                                
                                Image(systemName: "pencil")
                                    .padding(4)
                                    .bold()
                                    .foregroundColor(.white)
                                    .imageScale(.medium)
                                    .background{
                                        Color.primaryBrand
                                    }
                                    .cornerRadius(10)
                            }
                    }
            }
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam magna diam, ornare eget iaculis id, sagittis ut lectus. Donec sit amet mauris ac ligula elementum interdum. Ut id turpis vel ex viverra mattis. Vestibulum a elit imperdiet tellus tempus auctor ut id mauris.Nam magna diam, ornare eget iaculis id, sagittis ut lectus. Donec sit amet mauris ac ligula elementum interdum. Ut id turpis vel ex viverra mattis. Vestibulum a elit imperdiet tellus tempus auctor ut id mauris. Integer nisi sapien, elementum eu metus et, dictum finibus odio. Interdum Donec finibus nisi eu dui condimentum luctus.")
                .multilineTextAlignment(.center)
                .font(.callout)
                .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    ProfileView()
}
