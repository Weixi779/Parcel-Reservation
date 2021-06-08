//
//  CoreDataPart.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2021/6/6.
//

import SwiftUI

struct CoreDataPart :View {
    @Environment(\.managedObjectContext) private var moc

    var body: some View {
        Text("\(Users.entity().accessibilityElementCount())")
        FilteredList { (user:Users) in
            Text("(账户名:\(user.account) 密码:\(user.password)")
        }
    }
}


