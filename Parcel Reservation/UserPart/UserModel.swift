//
//  UserModel.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2021/6/6.
//

import Foundation

struct orderUser {
    private var account: String
    private var password: String
    private var name: String
    private var point: Int32
    
    
    init(_ account: String, _ password: String, _ name: String, _ point: Int32) {
        self.account = account
        self.password = password
        self.name = name
        self.point = point
    }
}


class User: ObservableObject {
    @Published var user: orderUser
    init() {
        user = orderUser("请先登录", "请先登录", "请先登录", 0)
    }
}
