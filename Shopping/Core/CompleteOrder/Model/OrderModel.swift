//
//  OrderModel.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

struct OrderModel: Codable, Hashable {
    var id = UUID().uuidString
    let total: Double
    var user: UserModel?
    let cart: [CartModel]
}
