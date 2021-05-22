//
//  ContentView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext


    var body: some View {
        Text("Hello,world!")
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
