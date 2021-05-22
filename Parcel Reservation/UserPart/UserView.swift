//
//  UserView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI

struct UserView: View {
    
    @State var IsSignUP = false
    var user: FetchedResults<Users>
    
    let backGroundColor:Color = Color("Color")
    
    let settingName1 = ["我的设置","我的收藏","我的通知","帮助与反馈"]
    let settingName2 = ["版本更新","即刻合伙人"]
    
    var body: some View {
        VStack{
            TopHead(90)
            VStack{
                HStack{
                    Spacer()
                    Button(action: { IsSignUP.toggle() }, label: {
                        Image("setting_icon")
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                    })
                }
                Spacer()
            }
            .frame(height: 100)
            .background(backGroundColor)
            .padding(.top, -70)
            
            VStack{
                HStack(alignment: .center){
                    CircleImage(imgName:"avatar")
                    .padding(.horizontal, 15)
                    VStack(alignment: .leading){
                        Text(isOneName())
                        HStack{
                            Image("coins")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(isOnePoint())
                        }
                    }
                    .padding(.horizontal, -10)
                    Spacer()
                }
                .frame(height: 100)
                .background(Color.white
                    .cornerRadius(10, antialiased: true))
                .shadow(radius: 5)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                
                VStack {
                    Form{
                        Section{
                            ForEach(settingName1, id:\.self){ name in
                                NavigationLink(destination: SignView(user: user).hiddenNGB()) {
                                    Text(name)
                                }
                            }
                        }
                        Section{
                            ForEach(settingName2, id:\.self){ name in
                                    Text("\(name)")
                            }
                            
                        }
                        Section{
                            NavigationLink(destination: AllUserView(user: user)) {
                                Text("走后门")
                            }
                        }
                    
                    }
                    
                }

                }
                .padding(.top, -60)
        }
        
        //.edgesIgnoringSafeArea(.top)
        .background(Color("Color"))
        
    }
    func isOneName() -> String{
        if user.count == 1 {
            return user[0].account
        }else{
            return "请先登录"
        }
    }
    
    func isOnePoint() -> String{
        if user.count == 1 {
            return "\(user[0].point)"
        }else{
            return "请先登录"
        }
    }
}


