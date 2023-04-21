//
//  Model.Card.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

extension RemoteModel {
    public struct Card: Codable {
        let cardNumber: String
        let cardType: String

        enum CodingKeys: String, CodingKey {
            case cardNumber = "card_number"
            case cardType = "card_type"
        }
    }
}
