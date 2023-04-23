//
//  Model.Card.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

public protocol RemoteModelCardProtocol: Codable {
    var cardNumber: String { get set }
    var cardType: String { get set }
    
}

extension RemoteModel {
    public struct Card: RemoteModelCardProtocol {
        public var cardNumber, cardType: String

        enum CodingKeys: String, CodingKey {
            case cardNumber = "card_number"
            case cardType = "card_type"
        }
    }
}
