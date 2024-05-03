//
//  UserHelper.swift
//  ProjetIos
//
//  Created by azertt on 3/5/2024.
//

import Foundation
import UIKit
import SwiftUI

class UserHelper {
    
    static func saveUser(email: String) {
        UserDefaults.standard.set(email,forKey: "email")
    }
    
    static func loadUser() -> String? {
        return UserDefaults.standard.string(forKey:  "email")
    }
    
    static func logoutUser() {
        UserDefaults.standard.set(nil,forKey: "email")
    }
    
    static func navigateToHome()
    {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView : HomeView())
            window.makeKeyAndVisible()
        }
    }
    
    static func navigateToLogin()
    {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView : ContentView())
            window.makeKeyAndVisible()
        }
    }
}
