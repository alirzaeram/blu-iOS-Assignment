//
//  Model.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation
import NetworkManger

extension Model {
    struct Home: Codable {
        var person: Model.Person
        var card: Model.Card
        var moreInfo: Model.MoreInfo
        var lastTransfer: String
        var note: String?
        
        var isFavorite: Bool?
        var lastFavorite: Int?
        
        enum CodingKeys: String, CodingKey {
            case person, card, note
            case lastTransfer = "last_transfer"
            case moreInfo = "more_info"
            case isFavorite = "is_favorite"
            case lastFavorite = "last_favorite"
        }
        
        init(isFavorite: Bool,person: Model.Person, card: Model.Card, lastTransfer: String, note: String? = nil, moreInfo: Model.MoreInfo) {
            self.isFavorite = isFavorite
            self.person = person
            self.card = card
            self.lastTransfer = lastTransfer
            self.note = note
            self.moreInfo = moreInfo
        }
        
        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            self.person = try container.decode(Model.Person.self, forKey: .person)
            self.card = try container.decode(Model.Card.self, forKey: .card)
            self.lastTransfer = try container.decode(String.self, forKey: .lastTransfer)
            self.note = try container.decodeIfPresent(String.self, forKey: .note)
            self.moreInfo = try container.decode(Model.MoreInfo.self, forKey: .moreInfo)
            self.isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
            self.lastFavorite = try container.decodeIfPresent(Int.self, forKey: .lastFavorite)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.person, forKey: .person)
            try container.encode(self.card, forKey: .card)
            try container.encode(self.moreInfo, forKey: .moreInfo)
            try container.encode(self.lastTransfer, forKey: .lastTransfer)
            try container.encode(self.note, forKey: .note)
            try container.encode(self.isFavorite, forKey: .isFavorite)
            try container.encode(self.lastFavorite, forKey: .lastFavorite)
        }
        
    }
}

extension Model.Home: Hashable {
    public static func == (lhs: Model.Home, rhs: Model.Home) -> Bool {
        return lhs.person == rhs.person &&
        lhs.card == rhs.card &&
        lhs.lastTransfer == rhs.lastTransfer &&
        lhs.note == rhs.note &&
        lhs.moreInfo == rhs.moreInfo
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(person)
        hasher.combine(card)
        hasher.combine(lastTransfer)
        hasher.combine(note)
        hasher.combine(moreInfo)
    }
}
