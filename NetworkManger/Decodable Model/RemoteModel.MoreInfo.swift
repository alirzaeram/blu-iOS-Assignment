//
//  Model.MoreInfo.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

extension RemoteModel {
    public struct MoreInfo: Codable {
        let numberOfTransfers, totalTransfer: Int

        enum CodingKeys: String, CodingKey {
            case numberOfTransfers = "number_of_transfers"
            case totalTransfer = "total_transfer"
        }
    }
}
