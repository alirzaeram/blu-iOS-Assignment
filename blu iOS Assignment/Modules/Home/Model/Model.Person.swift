//
//  Model.Person.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import Foundation
import NetworkManger

extension Model {
    struct Person: RemoteModelPersonProtocol {
        var fullName, avatar: String
        var email: String?
    }
}

extension Model.Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(fullName)
        hasher.combine(avatar)
        hasher.combine(email)
    }
}
