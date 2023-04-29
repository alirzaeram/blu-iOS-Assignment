//
//  Model.MoreInfo.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import Foundation
import NetworkManger

extension Model {
    struct MoreInfo: Codable, Hashable {
        var numberOfTransfers, totalTransfer: Int
        
        enum CodingKeys: String, CodingKey {
            case numberOfTransfers = "number_of_transfers"
            case totalTransfer = "total_transfer"
        }
    }
}

extension Model.MoreInfo {
    public static func == (lhs: Model.MoreInfo, rhs: Model.MoreInfo) -> Bool {
        return lhs.numberOfTransfers == rhs.numberOfTransfers &&
        lhs.totalTransfer == rhs.totalTransfer
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(numberOfTransfers)
        hasher.combine(totalTransfer)
    }
}
