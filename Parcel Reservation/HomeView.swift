//
//  ContentView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @StateObject var couriers = CourierItems()
    
    
    var body: some View {
        
        NavigationView{
            TabView {
                CourierView(items: self.couriers).tabItem {
                    Image(systemName: "cube.box")
                    Text("快递")
                }
                .tag(1)
                .hiddenNGB()
                
                MallsView().tabItem {
                    Image(systemName: "cart")
                    Text("商城")
                }.tag(2)
                .hiddenNGB()
                
                UserView()
                    .tabItem {
                    Image(systemName: "person")
                    Text("用户")
                }.tag(3)
                .hiddenNGB()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

            }
        }
        
        
    }
    
    
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
