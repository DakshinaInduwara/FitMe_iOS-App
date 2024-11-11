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
            HStack{
                Image("man")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.all, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray.opacity(0.4))
                    )
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    UserProfileView()
}
