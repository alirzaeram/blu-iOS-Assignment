//
//  Model.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/18/23.
//

import Foundation

public protocol RemoteModelHomeProtocol {
    var person: RemoteModel.Person { get }
    var card: RemoteModel.Card { get }
    var lastTransfer: String { get }
    var note: String? { get }
    var moreInfo: RemoteModel.MoreInfo { get }
}

extension RemoteModel {
    public struct Home: RemoteModelHomeProtocol, Decodable {
        public var person: Person
        public var card: Card
        public var lastTransfer: String
        public var note: String?
        public var moreInfo: MoreInfo
        
        enum CodingKeys: String, CodingKey {
            case person, card
            case lastTransfer = "last_transfer"
            case note
            case moreInfo = "more_info"
        }
    }
}
