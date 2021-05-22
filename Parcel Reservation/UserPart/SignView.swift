//
//  SignView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI
import CoreData

struct SignView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var user: FetchedResults<Users>
    var body: some View {
        LoginSignView(user: user)
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct LoginSignView : View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    var user: FetchedResults<Users>

    @State var IsSignUP = false
    @State var username = ""
    @State var pass = ""
    @State var rePass = ""
    
    var body: some View{
    
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            ZStack{
                LoginBackGround(IsSignUP: $IsSignUP)
                LoginView(user: user, IsSignup: $IsSignUP, username: $username, pass: $pass)
            }
            .offset(y: IsSignUP ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 100 : 130) : 0)
            .zIndex(1)
            
            SignUpView(IsSignUP: $IsSignUP, username: $username, pass: $pass ,rePass: $rePass)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        
        .preferredColorScheme(IsSignUP ? .dark : .light)
    }
}

struct LoginBackGround:View {
    @Binding var IsSignUP: Bool
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            
            Color("Color")
                .clipShape(CShape())
                        
            Path{path in
                                
                path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120 , y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            }
            .fill(Color.white)
       
            buttonSytle_1
            buttonSytle_2
            
        }
    }
    
    var buttonSytle_1: some View{
        Button(action: {
            withAnimation(.easeIn){ IsSignUP.toggle() }
        }) {
            Image(systemName: IsSignUP ? "xmark" : "person.fill")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color("Color"))
        }
        .offset(x: -110, y: -40)
        .disabled(IsSignUP ? false : true)
    }
    
    var buttonSytle_2: some View{
        Button(action: {
            withAnimation(.easeOut){IsSignUP.toggle()}
        }) {
            Image(systemName: IsSignUP ? "person.fill.badge.plus" : "xmark")
                .font(.system(size: IsSignUP ? 26 : 25, weight: .bold))
                .foregroundColor(.white)
        }
        .offset(x: -30, y: -40)
        .disabled(IsSignUP ? true : false)
    }
}
//-MARK: 配对界面
struct LoginView:View {
    @Environment (\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    @State var user: FetchedResults<Users>
    @Binding var IsSignup: Bool
    @Binding var username: String
    @Binding var pass: String
    var body: some View{
        VStack(alignment: .leading, spacing: 25) {
            HStack{
                backButton
                Spacer()
                Text("Login")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("Username").loginFont()
            VStack{
                TextField("Useraname", text: $username)
                divider
            }
            
            Text("Password").loginFont()
            VStack{
                TextField("Pasword", text: $pass)
                divider
            }
            
            HStack{
                Spacer()
                checkButton
                Spacer()
            }
            .padding(.top)
            
            Spacer(minLength: 0)
        }
        .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 25)
        .padding()
    }
    
    var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Back")
                .fontWeight(.bold)
                .foregroundColor(Color("Color"))
                .padding(.vertical)
                .padding(.horizontal,20)
                .background(Color.white)
                .clipShape(Capsule())
        }
    }
    
    var divider: some View{
        Divider()
            .background(Color.white.opacity(0.5))
    }
    var checkButton: some View{
        Button(action: {
            checkUser(username, pass)
        }) {
            Text("Login")
                .fontWeight(.bold)
                .foregroundColor(Color("Color"))
                .padding(.vertical)
                .padding(.horizontal,45)
                .background(Color.white)
                .clipShape(Capsule())
        }
    }
    
    private func checkUser(_ name:String,_ pass:String){
        for i in user{
            if i.name == name{
                print("找到账号")
                if i.password == pass {
                    print("登录成功")
                    let sb = FetchRequest<Users>(entity: Users.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name == %@", i.name))
                    var temp : FetchedResults<Users> {sb.wrappedValue}
                    user = temp
                    break
                }else{
                    print("登录失败")
                }
            }else{
                print("没有账号")
            }
        }
    }
}
//-MARK: 注册界面
struct SignUpView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode

    @Binding var IsSignUP:Bool
    @Binding var username:String
    @Binding var pass:String
    @Binding var rePass:String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 25) {
            
            HStack{
                backButton
                Spacer()
                Text("Sign Up")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color("Color"))
            }
            
            Text("Username").signFont()
            VStack{
                TextField("Useraname", text: $username)
                    .accentColor(Color.black)
                    .foregroundColor(.black)
                divider
            }
            
            Text("Password").signFont()
            VStack{
                TextField("Paswword", text: $pass)
                    .accentColor(Color.black)
                    .foregroundColor(.black)
                divider
            }
            
            Text("Re-Enter").signFont()
            VStack{
                TextField("Re-Enter", text: $rePass)
                    .accentColor(Color.black)
                    .foregroundColor(.black)
                divider
            }
            
            HStack{
                Spacer()
                SignUpButton
                Spacer()
            }
            .padding(.top)
            Spacer(minLength: 0)
        }
        .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 50)
        .padding()
    }
    
    var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Back")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal,20)
                .background(Color("Color"))
                .clipShape(Capsule())
        }
    }
    
    var divider: some View{
        Divider()
            .background(Color.white.opacity(0.5))
    }
    
    var SignUpButton: some View{
        //-MARK:添加事件
        Button(action: {
            addUser(username, pass, rePass)
        }) {
            Text("Sign Up")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal,45)
                .background(Color("Color"))
                .clipShape(Capsule())
        }
    }
    
    private func addUser(_ username:String,_ pass:String,_ rePass:String){
        withAnimation{
            if (pass == rePass){
                guard username != "" , pass != "" , rePass != "" else { return }
                let newUser = Users(context: viewContext)
                newUser.account = username
                newUser.name = username
                newUser.point = 0
                newUser.password = pass
                do {
                    try viewContext.save()
                    print(username)
                    print(rePass)
                    print("成功!")
                } catch  {
                    print(error.localizedDescription)
                }
            }else{
                print("两次密码输得不对")
            }
        }
    }
}
