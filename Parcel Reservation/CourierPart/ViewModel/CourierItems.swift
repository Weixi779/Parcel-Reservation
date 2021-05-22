//
//  CourierItems.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import Foundation

class CourierItems: ObservableObject{
    @Published var couriers: [Courier]{
        didSet{
            let encoder = JSONEncoder()
            if let encoder = try? encoder.encode(couriers) {
                UserDefaults.standard.set(encoder, forKey: "Courier")  //一旦改变 使用编码器
            }
        }
    }
    
    init() {
        if let courier = UserDefaults.standard.data(forKey: "Courier"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Courier].self, from: courier){
                self.couriers = decoded
                return
            }
        }
        self.couriers = [Courier].init()
    }
    
    func AddCourier(_ CourierCompany:String, _ PickDate:Date, _ PickCode:String, _ CellDate:String){
        let courier = Courier(CourierCompany: CourierCompany, PickDate: PickDate, PickCode: PickCode ,CellDate: CellDate)
        couriers.append(courier)
    }
    
    func SectionCourier(_ courier:Courier)-> Int{
        for i in 0..<couriers.count{
            if couriers[i] == courier{
                return i
            }
        }
        return -1
    }
    
    func RemoveCourier(_ courier:Courier){
        let index = SectionCourier(courier)
        couriers.remove(at: index)
    }
    
//    func RewriteCompany(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
}
