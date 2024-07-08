//
//  HouseMateApp.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/14/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct HouseMateApp: App {
    
    @State private var isLoggedIn = false
    @State private var isOnboard = false
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            
            
            if isLoggedIn{
                if isOnboard{
                    MainView()
                } else {
                    HouseholdView(isOnboard: $isOnboard)
                }
            } else {
                OnboardingView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

