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
            ChartsView()
                .tag("Charts")
                .tabItem{
                    Image(systemName:"chart.line.uptrend.xyaxis")
                }
            
            ProfileView()
                .tag("Profile")
                .tabItem{
                    Image(systemName:"person.crop.circle")
                }
            
            NotificationView()
                .tag("Notification")
                .tabItem{
                    Image(systemName:"bell.badge")
                }
            
            SettingsView()
                .tag("Settings")
                .tabItem{
                    Image(systemName:"gear")
                }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(Health())
}

