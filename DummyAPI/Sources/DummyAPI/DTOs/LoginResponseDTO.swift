//
//  File.swift
//  
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

public struct LoginResponseDTO: Codable {
    public let id: Int
    public let username: String
    public let email: String
    public let firstName: String
    public let lastName: String
    public let gender: String
    public let image: String
    public let token: String
    public let refreshToken: String

    private enum CodingKeys: String, CodingKey {
        case id, username, email, firstName, lastName, gender, image
        case token = "accessToken"
        case refreshToken
    }
}
