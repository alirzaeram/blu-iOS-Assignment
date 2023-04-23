//
//  AppStorage.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation

class AppStorage {
    
    static let shared = AppStorage()
    
    private var database: FavoriteLocalDB = .init()
    private let serialQueue = DispatchQueue(label: "com.example.app.storage-queue")
    
    internal var favorite: [Model.Home] = []
    
    private init() {
        do {
            try fetch()
        }catch {
            debugPrint("Fetch Failed")
        }
    }
    
    @discardableResult private func fetch() throws -> [Model.Home] {
        let array = try database.readFromFile()
        favorite = array.sorted { ($0.lastFavorite ?? Int.max) < ($1.lastFavorite ?? Int.max) }
        return favorite
    }

    fileprivate func saveCart() throws {
        try database.writeToFile(favorite)
    }
    
    private func syncCartForApplication() {
        do {
            let favorite = favorite.sorted { ($0.lastFavorite ?? Int.max) < ($1.lastFavorite ?? Int.max) }
            self.favorite = favorite
            try saveCart()
        }catch let error {
            debugPrint("CartManager Saving Error: \(error.localizedDescription)")
        }
    }
    
}

extension AppStorage {
    public func add(item: Model.Home) {
        self.favorite.append(item)
        self.syncCartForApplication()
    }
    
    public func add(item: [Model.Home]) {
        self.favorite.append(contentsOf: item)
        self.syncCartForApplication()
    }
    
    public func remove(item: Model.Home) {
        if let index = self.favorite.firstIndex(of: item) {
            self.favorite.remove(at: index)
            self.syncCartForApplication()
        }
    }
    
    public func remove(item: [Model.Home]) {
        _ = item.map {
            self.remove(item: $0)
        }
    }
    
    public func sync(favorite: [Model.Home]) {
        self.favorite = favorite
        self.syncCartForApplication()
    }
    
    public func removeAll() {
        self.favorite = []
        self.syncCartForApplication()
    }
}
