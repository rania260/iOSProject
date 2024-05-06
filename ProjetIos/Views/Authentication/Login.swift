//
//  Login.swift
//  ProjetIos
//
//  Created by azertt on 28/4/2024.
//

import SwiftUI
import FirebaseAuth


struct Login: View {
    @Binding var showSignup: Bool
    // View properties
    @State private var emailID: String = "RezguiRania@gmail.com"
    @State private var password: String = "123456"
    var body: some View {
        VStack(alignment: .leading,spacing:  15, content: {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                //custom text fiels
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true , value: $password)
                    .padding(.top, 5)
                
                Button("Forget Password?") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.color)
                .hSpacing(.trailing)
                
                //login button
                GradientButton(title: "Login", icon: "arrow.right") {
                    login()
                }
                /* Button(action: loginUser){
                 Text("Login")
                 .fontWeight(.bold)
                 .foregroundStyle(.white)
                 .padding(.vertical, 12)
                 .padding(.horizontal, 35)
                 .background(.linearGradient(colors: [.color, .color1, .color2 ], startPoint: .top, endPoint: .bottom), in: .capsule)
                 }*/
                
                    .hSpacing(.trailing)
                // disabling Until the data is entered
                    .disableWithOpacity(emailID.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                Button("SignUp"){
                    
                    showSignup.toggle()
                    
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
    
    private func login() {
        Auth.auth().signIn(withEmail: emailID, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success login")
                UserHelper.saveUser(email: emailID)
                UserHelper.navigateToHome()
            }
        }
    }
}



#Preview {
    ContentView()
}
