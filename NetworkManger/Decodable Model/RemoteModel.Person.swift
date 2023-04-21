//
//  Model.Person.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

extension RemoteModel {
    public struct Person: Codable {
        let fullName: String
        let email: String?
        let avatar: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case email, avatar
        }
    }
}
