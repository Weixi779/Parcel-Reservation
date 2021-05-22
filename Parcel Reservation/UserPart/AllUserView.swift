//
//  AllUserView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/22.
//

import SwiftUI

struct AllUserView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var user: FetchedResults<Users>
    var body: some View {
        List(user){ u in
            HStack{
                Text("\(u.account)")
                Spacer()
                Text("\(u.password)")
            }
            
            
        }
    }
}

//struct AllUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllUserView(user: <#FetchedResults<Users>#>)
//    }
//}
