//
//  Model.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/18/23.
//

import Foundation

public protocol RemoteModelHomeProtocol: Codable {
    var person: RemoteModelPersonProtocol { get }
    var card: RemoteModelCardProtocol { get }
    var lastTransfer: String { get }
    var note: String? { get }
    var moreInfo: RemoteModelMoreInfoProtocol { get }
}

extension RemoteModel {
    public struct Home: RemoteModelHomeProtocol {
        
        public var person: RemoteModelPersonProtocol
        public var card: RemoteModelCardProtocol
        public var moreInfo: RemoteModelMoreInfoProtocol
        public var lastTransfer: String
        public var note: String?
        
        enum CodingKeys: String, CodingKey {
            case person, card, note
            case lastTransfer = "last_transfer"
            case moreInfo = "more_info"
        }
        
        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<RemoteModel.Home.CodingKeys> = try decoder.container(keyedBy: RemoteModel.Home.CodingKeys.self)
            self.person = try container.decode(RemoteModel.Person.self, forKey: RemoteModel.Home.CodingKeys.person)
            self.card = try container.decode(RemoteModel.Card.self, forKey: RemoteModel.Home.CodingKeys.card)
            self.lastTransfer = try container.decode(String.self, forKey: RemoteModel.Home.CodingKeys.lastTransfer)
            self.note = try container.decodeIfPresent(String.self, forKey: RemoteModel.Home.CodingKeys.note)
            self.moreInfo = try container.decode(RemoteModel.MoreInfo.self, forKey: RemoteModel.Home.CodingKeys.moreInfo)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.person, forKey: .person)
            try container.encode(self.card, forKey: .card)
            try container.encode(self.moreInfo, forKey: .moreInfo)
            try container.encode(self.lastTransfer, forKey: .lastTransfer)
            try container.encode(self.note, forKey: .note)
        }
        
    }
}
