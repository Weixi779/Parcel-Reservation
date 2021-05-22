//
//  ADView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2021/5/21.
//

import Foundation
import SwiftUI
import WebKit


struct TabViewDemo: View {
    var ADS = Advertisings()
    @State var isPressed = false
//    @State var timeRemaining = 0
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        TabView{
            ForEach(ADS.AD){ad in
                Images(ad: ad)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 150, alignment: .topLeading)
    }
//    func checkNumber(){
//        if timeRemaining == ADS.AD.count {
//            timeRemaining = 0
//        }
//    }
}

struct Images: View {
    var ad: Advertising
    @State var isPressed = false
    var body: some View {
        VStack{
            Image("\(ad.name)")
                .resizable()
                .frame(height: 150)
                .onTapGesture { isPressed.toggle() }
        }
        .sheet(isPresented: $isPressed) {
            SwiftUIWebView(url: URL(string: ad.url))
        }
    }
}

struct SwiftUIWebView: UIViewRepresentable {
    let url: URL?
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let myURL = url else { return }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
    
}
