//
//  UserModel.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

struct UserModel: Codable, Hashable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let address: Address
    let bank: Bank
    
    static let sampleUser: UserModel = .init(
        id: 1,
        username: "Deepanshu Bajaj",
        email: "deepanshu.bajaj98@gmail.com",
        firstName: "Deepanshu",
        lastName: "Bajaj",
        gender: "Male",
        image: "https://dummyjson.com/icon/emilys/128",
        address: .init(address: "Xyz", city: "Delhi", state: "Delhi", country: "IN", coordinates: .init(lat: 1, lng: 1)),
        bank: .init(cardExpire: "223", cardNumber: "2342342", cardType: "adasd", currency: "tl mlsf", iban: "1231231231")
    )
}

struct Address: Codable, Hashable {
    let address: String
    let city: String
    let state: String
    let country: String
    let coordinates: Coordinate
}

struct Coordinate: Codable, Hashable {
    let lat: Double
    let lng: Double
}

struct Bank: Codable, Hashable {
    let cardExpire: String
    let cardNumber: String
    let cardType: String
    let currency: String
    let iban: String
}
