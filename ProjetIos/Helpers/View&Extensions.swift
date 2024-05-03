//
//  View&Extensions.swift
//  ProjetIos
//
//  Created by azertt on 30/4/2024.
//

import SwiftUI
//custom swiftUI View extension
extension View {
    //view alignement
    @ViewBuilder
    func hSpacing(_ alignement: Alignment = .center) -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignement)
    }
    
    @ViewBuilder
    func vSpacing(_ alignement: Alignment = .center) -> some View {
        self
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignement)
    }
    // disable with opacity
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
