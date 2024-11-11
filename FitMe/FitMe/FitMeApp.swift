//
//  FitMeApp.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-10-29.
//

import SwiftUI
import UserNotifications // Import UserNotifications
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FitMeApp: App {
    @StateObject var healthKit = Health()
    
    
    
    init() {
        requestNotificationPermission()
        // Request notification permission on app launch
    }

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(healthKit)
        }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            } else if granted {
                print("Notification permission granted.")
            }
        }
    }
}
