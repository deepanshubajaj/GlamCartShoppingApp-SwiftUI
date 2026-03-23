//
//  File.swift
//  
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

public struct LoginRequestDTO: Codable {
    public let username: String
    public let password: String
    public let expiresInMins: Int
}
