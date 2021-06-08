//
//  CourierView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI

struct CourierView: View {
    @State private var showAddView = false
    
    @ObservedObject var items:CourierItems
        
//    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)

    var body: some View {
            VStack{
                TopHead(90)
                    .shadow(radius: 10)
                VStack{
                    HStack{
                        Spacer()
                        Button(action: { showAddView.toggle() } ) {
                            Image(systemName: "plus")
                                .foregroundColor(Color(themeData.Color4))
                                .imageScale(.large)
                        }
                        .padding()
                        .sheet(isPresented: $showAddView) {
                            AddSheetView(showingSheet: $showAddView)
                                .environmentObject(items)
                        }
                        
                    }
                    Spacer()
                }
                .frame(height: 70)
                .padding(.top, -70)
                
                VStack{
                    TabViewDemo()
                        .cilp()
                        .padding(.horizontal,15)
                        .padding(.vertical,15)
                    VStack{
                        CourierCell(items:items)
                    }
                    Spacer()
                }
                .padding(.top,-60)
            }
            
        }

        
    }
struct CourierView_Previews: PreviewProvider {
    static var previews: some View {
        CourierView(items: CourierItems())
    }
}




