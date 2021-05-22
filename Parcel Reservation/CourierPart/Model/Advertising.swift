//
//  Advertising.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/22.
//

import Foundation

struct Advertising:Identifiable {
    let name: String
    let url: String
    let id = UUID()
}

class Advertisings {
    var AD = [Advertising]()
    init() {
        AD.append(AddAD("guanggao_1",
                        "https://game.bilibili.com/cyberpunk2077/?msource=1&source=trackadf_60db1b58132f4f5ab45ea8ab6d34412d&gameID=4079"))
        AD.append(AddAD("guanggao_2",
                        "https://www.bilibili.com/read/cv8422747"))
        AD.append(AddAD("guanggao_3",
                        "https://www.bilibili.com/blackboard/topic/activity-6zk8M5IX9.html"))
        AD.append(AddAD("guanggao_4",
                        "https://b23.tv/Yk7LZL"))
        AD.append(AddAD("guanggao_5",
                        "https://www.bilibili.com/read/cv8430581?from=1002&spm_id_from=333.851.b_7265706f7274466972737431.4"))
    }
    func AddAD(_ name:String,_ url: String) -> Advertising{
        Advertising(name: name, url: url)
    }
}
