//
//  TabView.swift
//  Health-Tracker
//
//  Created by Dakshina Induwara on 2024-10-24.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tag("Home")
                .tabItem{
                    Image(systemName:"house")
                }
            
            SettingsView()
                .tag("Content")
                .tabItem{
                    Image(systemName:"gear")
                }
            
            ProfileView()
                .tag("Content")
                .tabItem{
                    Image(systemName:"figure")
                }
        }
    }
}

#Preview {
    TabBarView()
}
