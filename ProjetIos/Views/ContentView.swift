//
//  ContentView.swift
//  ProjetIos
//
//  Created by azertt on 26/4/2024.
//

import SwiftUI

struct ContentView: View {
    // View Properties
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup){
                    Signup(showSignup: $showSignup)
                }
        }
        .overlay{
            CircleView()
                .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
        }
    }
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.color2 , .color1 , .color], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        //Moving when the signup pages dismisses
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 10)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
