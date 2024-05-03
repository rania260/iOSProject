//
//  ProjetIosApp.swift
//  ProjetIos
//
//  Created by azertt on 26/4/2024.
//

import SwiftUI
import Firebase

@main
struct ProjetIosApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
