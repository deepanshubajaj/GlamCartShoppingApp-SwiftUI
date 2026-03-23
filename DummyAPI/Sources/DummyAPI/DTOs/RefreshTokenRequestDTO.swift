//
//  File.swift
//  
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

public struct RefreshTokenRequestDTO: Codable {
    public let refreshToken: String
    public let expiresInMins: Int
}
