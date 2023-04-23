//
//  Model.MoreInfo.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import Foundation
import NetworkManger

extension Model {
    struct MoreInfo: RemoteModelMoreInfoProtocol {
        var numberOfTransfers, totalTransfer: Int
    }
}
