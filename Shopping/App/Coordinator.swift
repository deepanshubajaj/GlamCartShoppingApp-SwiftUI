//
//  AppCoordinator.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

enum Route: Hashable {
    case login
    case signup
    case tabBar
    case productDetail(Product)
    case cart
    case completeOrder(OrderModel)
}

final class Coordinator: ObservableObject {
    
    @Published var path: [Route] = []
    
    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
