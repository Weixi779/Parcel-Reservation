//
//  MallImages.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/22.
//

import Foundation

struct commodity:Identifiable {
    let imageString: String
    let pointCast: Int
    let id = UUID()
}

class Commodity: ObservableObject {
    @Published var commoditys = [commodity]()
    init() {
        initCommoditys()
    }
    
    func initCommoditys() {
        commoditys = [commodity(imageString: "必胜鸡毛绒玩具", pointCast: 20),
                      commodity(imageString: "锦鸡毛绒玩具", pointCast: 20),
                      commodity(imageString: "黑鸡毛绒玩具", pointCast: 20),
                      commodity(imageString: "高冷鸡毛绒玩具", pointCast: 20),
                      commodity(imageString: "貔貅鸡毛绒玩具", pointCast: 20),
                      commodity(imageString: "一键开关雨伞", pointCast: 50),
                      commodity(imageString: "偷来周边小黑帽", pointCast: 50)]
    }
    
    func filterCommoditys(_ keyValue:String) {
        commoditys = commoditys.filter{ $0.imageString.contains(keyValue) }
    }
    
    func resetCommoditys() {
        initCommoditys()
    }
    
}
