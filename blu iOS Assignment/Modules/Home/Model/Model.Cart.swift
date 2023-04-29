//
//  Model.Cart.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import Foundation
import NetworkManger

extension Model {
    struct Card: Codable, Hashable {
        var cardNumber, cardType: String
        
        enum CodingKeys: String, CodingKey {
            case cardNumber = "card_number"
            case cardType = "card_type"
        }
    }
}

extension Model.Card {
    public static func == (lhs: Model.Card, rhs: Model.Card) -> Bool {
        return lhs.cardNumber == rhs.cardNumber &&
        lhs.cardType == rhs.cardType
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(cardNumber)
        hasher.combine(cardType)
    }
}
