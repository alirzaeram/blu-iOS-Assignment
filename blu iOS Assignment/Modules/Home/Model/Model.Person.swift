//
//  Model.Person.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import Foundation
import NetworkManger

extension Model {
    struct Person: Codable {
        var fullName, avatar: String
        var email: String?
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case avatar, email
        }
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<Model.Person.CodingKeys> = try decoder.container(keyedBy: Model.Person.CodingKeys.self)
            self.fullName = try container.decode(String.self, forKey: Model.Person.CodingKeys.fullName)
            self.avatar = try container.decode(String.self, forKey: Model.Person.CodingKeys.avatar)
            self.email = try container.decodeIfPresent(String.self, forKey: Model.Person.CodingKeys.email)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: Model.Person.CodingKeys.self)
            try container.encode(self.fullName, forKey: Model.Person.CodingKeys.fullName)
            try container.encode(self.avatar, forKey: Model.Person.CodingKeys.avatar)
            try container.encodeIfPresent(self.email, forKey: Model.Person.CodingKeys.email)
        }
    }
}

extension Model.Person: Hashable {
    public static func == (lhs: Model.Person, rhs: Model.Person) -> Bool {
        return lhs.fullName == rhs.fullName &&
        lhs.email == rhs.email &&
        lhs.avatar == rhs.avatar
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(fullName)
        hasher.combine(email)
        hasher.combine(avatar)
    }
}
