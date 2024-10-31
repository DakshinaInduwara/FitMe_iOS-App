//
//  TabView.swift
//  Health-Tracker
//
//  Created by Gairuka Bandara on 2024-10-24.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var healthKit: Health
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tag("Home")
                .tabItem{
                    Image(systemName:"house")
                }
                .environmentObject(healthKit)
            
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
