//
//  ProfileView.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-11.
//

import SwiftUI

struct UserProfileView: View {
    @AppStorage("profileName") var profileName: String?
    @AppStorage("profileImage") var profileImage: String?
    @State private var isEditingName = true
    @State private var currentName = ""
    @State private var isEditingImage = false
    @State private var selectedImage: String?

    var images = ["man","man-2","man-3","man-4","man-5","woman","woman-2","woman-3","woman-4","woman-5","woman-6","woman-7"]
    
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Image(profileImage ?? "man")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.all, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray.opacity(0.25))
                    )
                    .onTapGesture {
                        isEditingImage = true
                    }
                
                VStack(alignment: .leading) {
                    Text("Good morning")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text(profileName ?? "Name")
                        .font(.title)
                }
            }
            
            if isEditingName {
                TextField("name", text: $currentName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
                HStack {
                    Button {
                        print("cancel")
                    } label: {
                        Text("Cancel")
                            .padding()
                            .frame(maxWidth: 200)
                            .foregroundColor(.red)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray.opacity(0.1))
                            )
                    }
                    Button {
                        print("done")
                    } label: {
                        Text("Done")
                            .padding()
                            .frame(maxWidth: 200)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                            )
                    }
                }
            }
            
            if isEditingImage {
                ScrollView(.horizontal){
                    HStack{
                        ForEach(images, id: \.self) { image in
                            Button {
                                withAnimation{
                                    selectedImage = image
                                }
                            } label: {
                                VStack{
                                    Image(image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        
                                    if selectedImage == image {
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(.primary)
                                    }
                                }
                                .padding()
                            }
                            .shadow(radius: selectedImage == image ? 5 : 0)
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.15))
                )
                Button{
                    withAnimation {
                        profileImage = selectedImage
                        isEditingImage = false
                    }
                } label: {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: 200)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                        )
                }
                .padding(.bottom)
            }
            
            VStack{
                FitMeProfileButton(title: "Edit Name", image: "square.and.pencil"){
                    print("name")
                }
                
                FitMeProfileButton(title: "Edit Image", image: "square.and.pencil"){
                    isEditingImage = true
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.15))
            )
            
            VStack{
                FitMeProfileButton(title: "Contact Us", image: "envelope"){
                    print("contact")
                }
                
                FitMeProfileButton(title: "Privacy Policy", image: "document"){
                    print("privacy")
                }
                FitMeProfileButton(title: "Terms of Services", image: "document.badge.arrow.up"){
                    print("terms")
                }
                
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.15))
            )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onAppear {
            selectedImage = profileImage
        }
    }
}

#Preview {
    UserProfileView()
}
