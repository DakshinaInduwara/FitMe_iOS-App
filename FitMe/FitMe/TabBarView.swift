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
                .tag("Settings")
                .tabItem{
                    Image(systemName:"gear")
                }
            
            ProfileView()
                .tag("Profile")
                .tabItem{
                    Image(systemName:"figure")
                }
            ChartsView()
                .tag("Charts")
                .tabItem{
                    Image(systemName:"chart.line.uptrend.xyaxis")
                }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(Health())
}

