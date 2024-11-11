//
//  ProfileView.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-11.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Image("man")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.all, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray.opacity(0.25))
                    )
                VStack(alignment: .leading) {
                    Text("Good morning")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Name")
                        .font(.title)
                }
            }
            
            VStack{
                FitMeProfileButton(title: "Edit Name", image: "square.and.pencil"){
                    print("name")
                }
                
                FitMeProfileButton(title: "Edit Image", image: "square.and.pencil"){
                    print("image")
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
    }
}

#Preview {
    UserProfileView()
}
