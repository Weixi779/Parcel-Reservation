//
//  ModifierUII.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI


struct LoginFont:ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.top,10)
    }
}
struct SignFont:ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(themeData.Color3))
            .padding(.top,10)
    }
}

extension View{
    
    func loginFont() -> some View {
        self.modifier(LoginFont())
    }
    func signFont() -> some View {
        self.modifier(SignFont())
    }
}
