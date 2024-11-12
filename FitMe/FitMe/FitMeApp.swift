//
//  FitMeApp.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-10-29.
//

import SwiftUI
import UserNotifications // Import UserNotifications
import FirebaseCore
import Firebase
import FirebaseAuth

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
    @StateObject private var appState = AppState()
    
    
    init() {
        requestNotificationPermission()
        // Request notification permission on app launch
        
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(healthKit)
//            if appState.isUserLoggedIn {
//                            TabBarView()
//                                .environmentObject(appState)
//                                .environmentObject(healthKit)
//                        } else {
//                            SignInView()
//                                .environmentObject(appState)
//                        }
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
