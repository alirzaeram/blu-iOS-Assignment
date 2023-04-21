//
//  FavoriteLocalDB.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation
import LocalDatabaseManager

final class FavoriteLocalDB: LocalDatabase<[Model.Home]> {
    override var modelFileName: String { "Favorite.json" }
    
    override init() {
        super.init()
    }
}
