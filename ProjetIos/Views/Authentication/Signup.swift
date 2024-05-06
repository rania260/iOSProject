//
//  Signup.swift
//  ProjetIos
//
//  Created by azertt on 2/5/2024.
//

import SwiftUI
import FirebaseAuth

struct Signup: View {
    @Binding var showSignup: Bool
    // View properties
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(alignment: .leading,spacing:  15, content: {
            // Back button
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                //custom text fiels
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                CustomTF(sfIcon: "person", hint: "Full name", value: $fullName)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true , value: $password)
                    .padding(.top, 5)
                
                //Signin button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    register()
                }
                .hSpacing(.trailing)
                // disabling Until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Button("Login"){
                    
                    showSignup = false
                    
                }
                .fontWeight(.bold)
                .tint(.color)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
    func register() {
        Auth.auth().createUser(withEmail: emailID, password: password) { (result, error) in
            if error != nil {
                print("regisration problem: \(String(describing: error?.localizedDescription))")
            } else {
                print("success registration")
                UserHelper.saveUser(email: emailID)
                UserHelper.navigateToHome()
            }
        }
    }
}

#Preview {
    ContentView()
}
