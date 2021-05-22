//
//  Courier.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import Foundation

struct Courier: Codable, Identifiable,Equatable{
    var id = UUID()
    var CourierCompany: String
    
    var PickDate: Date
    var PickCode: String
    
    var CellDate: String
    
    static func ==(lhs:Courier , rhs: Courier)->Bool{ lhs.id == rhs.id }
}
