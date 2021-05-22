//
//  Users+CoreDataProperties.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var account: String
    @NSManaged public var password: String
    @NSManaged public var name: String
    @NSManaged public var point: Int32
    @NSManaged public var id: UUID?

}

extension Users : Identifiable{
    func checkUser(_ account:String,_ password:String) -> Bool{
        if self.account == account &&  self.password == account {
            return true
        }
        return false
    }
}
