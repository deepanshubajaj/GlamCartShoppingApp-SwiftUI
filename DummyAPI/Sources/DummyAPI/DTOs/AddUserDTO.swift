//
//  File.swift
//  
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation

public struct AddUserDTO: Codable {
    public let firstName: String
    public let lastName: String
    public let username: String
    public let password: String
}
