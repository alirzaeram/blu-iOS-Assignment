//
//  Model.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation
import NetworkManger

extension Model {
    struct Home: RemoteModelHomeProtocol, Codable {
        var id: UUID
        var isFavorite: Bool
        var person: RemoteModel.Person
        var card: RemoteModel.Card
        var lastTransfer: String
        var note: String?
        var moreInfo: RemoteModel.MoreInfo
        
        init(isFavorite: Bool,person: RemoteModel.Person, card: RemoteModel.Card, lastTransfer: String, note: String? = nil, moreInfo: RemoteModel.MoreInfo) {
            self.id = .init()
            self.isFavorite = isFavorite
            self.person = person
            self.card = card
            self.lastTransfer = lastTransfer
            self.note = note
            self.moreInfo = moreInfo
        }
        
    }
}

extension Model.Home: Equatable {
    static func == (lhs: Model.Home, rhs: Model.Home) -> Bool {
        lhs.id == rhs.id
    }
}
