//
//  Model.Person.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

public protocol RemoteModelPersonProtocol: Codable {
    var fullName: String { get set }
    var email: String? { get set }
    var avatar: String { get set }
}

extension RemoteModel {
    public struct Person: RemoteModelPersonProtocol {
        public var fullName, avatar: String
        public var email: String?
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case email, avatar
        }
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: RemoteModel.Person.CodingKeys.self)
            try container.encode(self.fullName, forKey: RemoteModel.Person.CodingKeys.fullName)
            try container.encodeIfPresent(self.email, forKey: RemoteModel.Person.CodingKeys.email)
            try container.encode(self.avatar, forKey: RemoteModel.Person.CodingKeys.avatar)
        }
    }
}
