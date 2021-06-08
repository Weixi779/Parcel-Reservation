//
//  CoreDataList.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2021/6/6.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequset: FetchRequest<T>
    var users: FetchedResults<T> { fetchRequset.wrappedValue }
    let content: (T) -> Content
    init(@ViewBuilder content: @escaping (T) -> Content) {
        fetchRequset = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: [])
        self.content = content
    }
    var body: some View {
        List(fetchRequset.wrappedValue, id:\.self) { users in
            self.content(users)
        }
    }
}
