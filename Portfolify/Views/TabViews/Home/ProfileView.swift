//
//  ProfileView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    let maxPhotosToSelect = 1
    
    @StateObject var vm = PhotoSelectorViewModel()
    @EnvironmentObject var signUpVM: SignUpViewModel
    @Environment(\.presentationMode) var presentationMode

    @State var temp = ""
    @State var dp: UIImage = UIImage(systemName: "person")!
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Biogragphy")
                    .font(.title)
                    .bold()
                    .fontDesign(.monospaced)
                
                if vm.images.isEmpty {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 60, height: 60)
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
                } else {
                    Image(uiImage: dp)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
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
                }
                
                
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name: ")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .padding(.leading)
                                .padding(.bottom, -10)
                            CustomTextField(fieldTxt: $signUpVM.signUpDataObj.name, imageName: "person", text: "Enter Name")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("High School: ")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.bottom, -10)
                        CustomTextField(fieldTxt: $signUpVM.signUpDataObj.highSchool, imageName: "building.columns", text: "Enter High School")
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("CGPA ")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .padding(.leading)
                                .padding(.bottom, -10)
                            
                            CustomTextField(fieldTxt: $signUpVM.signUpDataObj.cgpa, imageName: "number", text: "Enter CGPA")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Graduation Year: ")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .padding(.leading)
                                .padding(.bottom, -10)
                            CustomTextField(fieldTxt: $signUpVM.signUpDataObj.graduationYear, imageName: "graduationcap.fill", text: "Enter Graduation Year")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("About")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.bottom, -10)
                        CustomTextField(fieldTxt: $signUpVM.signUpDataObj.about, imageName: "highlighter", text: "Enter Additional Info.")
                    }
                }
                
                Spacer()
                
                Button {
                    signUpVM.saveData()
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Save")
                        .padding(15)
                        .foregroundColor(Color.txt)
                        .font(.title3)
                        .background {
                            Color(.label)
                        }
                        .cornerRadius(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.bdr, lineWidth: 1)
                        }
                }
                
                Spacer()
            }
            .padding()
            .onChange(of: vm.selectedPhotos) { _, _ in
                vm.convertDataToImage()
                
            }
            .onChange(of: vm.images) { _, _ in
                if !vm.images.isEmpty {
                    setImageData(image: vm.images[0])
                    dp = vm.images[0]
                }
            }
            .onAppear {
                signUpVM.loadData()
                if let data = signUpVM.signUpDataObj.imageData {
                    dp = UIImage(data: data)!
                    vm.images.append(dp)
                }
            }
        }
    }
    
    func setImageData(image: UIImage) {
        signUpVM.signUpDataObj.imageData = image.jpegData(compressionQuality: 1.0)
    }
}

//#Preview {
//    ProfileView()
//}
