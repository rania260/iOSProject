//
//  HomeView.swift
//  ProjetIos
//
//  Created by azertt on 3/5/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            content
            .navigationTitle("Welcome")
            .toolbar {
                Button("Logout") {
                    UserHelper.logoutUser()
                    UserHelper.navigateToLogin()
                }
            }
        }
    }
    
    var content: some View {
        Text("hi")
    }
}

#Preview {
    HomeView()
}
