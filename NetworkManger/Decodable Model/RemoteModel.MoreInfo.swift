//
//  Model.MoreInfo.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

public protocol RemoteModelMoreInfoProtocol: Codable {
    var numberOfTransfers: Int { get set }
    var totalTransfer: Int { get set }
}

extension RemoteModel {
    public struct MoreInfo: RemoteModelMoreInfoProtocol {
        public var numberOfTransfers, totalTransfer: Int

        enum CodingKeys: String, CodingKey {
            case numberOfTransfers = "number_of_transfers"
            case totalTransfer = "total_transfer"
        }
    }
}
