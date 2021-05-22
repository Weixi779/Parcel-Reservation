//
//  ModifierUI.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI

func TopHead(_ height:Int) -> some View{
    let backGroundColor = GiveMeBackgroundColor()

    var body: some View{
        VStack{
            backGroundColor
        }
        .frame(height: CGFloat(height))
        .edgesIgnoringSafeArea(.top)
    }
    return body
}
struct Cilp:ViewModifier{
    
    let LineWidth: CGFloat = 4
    let CornerRadius: CGFloat = 20
    
    func body(content :Content) -> some View{
        content
            //剪切方法
            .overlay(RoundedRectangle(cornerRadius: CornerRadius).stroke(Color.green,lineWidth: LineWidth))
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius))
            .padding()

        //  .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange,lineWidth: 3))

    }
}
//struct FontCapsule:ViewModifier {
//    func body(content: Content) -> some View {
//        
//    }
//}

struct FontDesign:ViewModifier {
    func body(content: Content) -> some View {
        content
            .accentColor(Color.orange)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.white)
            .keyboardType(.decimalPad)
    }
}

func GiveMeBackgroundColor()->Color{
    return Color("Color")
}

struct BackGroundColor:ViewModifier {
    let backGroundColor = GiveMeBackgroundColor()
    func body(content: Content) -> some View {
        content
            .background(backGroundColor)
    }
}

struct HiddenNGB:ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            .edgesIgnoringSafeArea([.top, .bottom])
    }
}
extension View{
    
    func fontDesign() -> some View {
        self.modifier(FontDesign())
    }
    
    func cilp() -> some View {
        self.modifier(Cilp())
    }
    
    func backGroundColor() -> some View{
        self.modifier(BackGroundColor())
    }
    
    func hiddenNGB() -> some View{
        self.modifier(HiddenNGB())
    }
}
