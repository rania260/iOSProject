//
//  CustomTF.swift
//  ProjetIos
//
//  Created by azertt on 2/5/2024.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    //hides TextFields
    var isPassword: Bool = false
    @Binding var value: String
    // view property
    @State private var showPassword: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8,content: {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                    
                } else {
                    TextField(hint, text: $value)
                }
                Divider()
            })
            .overlay(alignment: .trailing) {
                // password reveal button
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    })
                }
            }
        })
    }
}
