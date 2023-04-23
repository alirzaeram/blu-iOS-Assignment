//
//  ViewModel.Home.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation
import NetworkManger

extension ViewModel {
    class Home: HomeViewModelProtocol {
        var router: Router
        var currentPagination: Int
        var model: Model.List
        
        // Protocol object of network manager object
        var networkManage: any NetworkManagerProtocol
        // Singleton object of local db manager object
        var localDBManage: AppStorage
        
        var networkItems: [RemoteModelHomeProtocol] = [Model.Home]()
        weak var delegate: HomeViewProtocol?
        
        init(router: Router) {
            self.router = router
            
            self.networkManage = AppNetworkManager.init()
            self.localDBManage = .shared
            
            self.currentPagination = 0
            self.model = .init(favorite: [], list: [])
        }
        
        func shouldFetch() {
            self.fetchData { [weak self] result in
                guard let self,
                      let delegate = self.delegate else { return }
                
                switch result {
                case .failure(let error):
                    delegate.shouldShowError(self, with: error)
                case .success(let model):
                    self.model.favorite.append(contentsOf: model.favorite)
                    self.model.list.append(contentsOf: model.list)
                    
                    delegate.shouldShowList(self, with: self.model)
                }
            }
        }
        
        private func fetchData(completion: @escaping (Result<(Model.List), Error>) -> Void) {
            var networkResult: [Model.Home]?
            var dbResult: [Model.Home] = []
            
            let dispatchGroup = DispatchGroup()
            
            // Fetch data from db
            dispatchGroup.enter()
            dbResult = self.localDBManage.favorite
            dispatchGroup.leave()
            
            // Fetch data from network
            dispatchGroup.enter()
            currentPagination += 1
            networkManage.fetchHome(currentPagination) { [weak self] result in
                defer {
                    dispatchGroup.leave()
                }
                
                guard let self else { return }
                switch result {
                case .failure(let err):
                    completion(.failure(err))
                case .success(let model):
                    networkResult = self.mapModels(model)
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                guard var networkResult else {
                    completion(.failure(AppError.tryAgain))
                    return
                }
                
                var hashTable = [String: Bool]()

                // Populate hash table with items from array1
                for item in dbResult.enumerated() {
                    hashTable[item.element.person.fullName] = true
                }

                // Search for matching items in array2
                for item in networkResult.enumerated() {
                    if let found = hashTable[item.element.person.fullName], found {
                        networkResult[item.offset].isFavorite = true
                    }else {
                        networkResult[item.offset].isFavorite = false
                    }
                }
                
                completion(.success(.init(favorite: dbResult, list: networkResult)))
            }
        }
        
        private func mapModels(_ remote: [RemoteModelHomeProtocol]) -> [Model.Home] {
            return remote.map {
                .init(isFavorite: false,
                      person: .init(fullName: $0.person.fullName, avatar: $0.person.avatar, email: $0.person.email),
                      card: .init(cardNumber: $0.card.cardNumber, cardType: $0.card.cardType),
                      lastTransfer: $0.lastTransfer, note: $0.note,
                      moreInfo: .init(numberOfTransfers: $0.moreInfo.numberOfTransfers, totalTransfer: $0.moreInfo.totalTransfer))
            }
        }
        
        internal func navigateDetail(_ model: Model.Home) {
            router.navigateToDetail(model)
        }
        
        internal func shouldChangeFavorite(_ model: Model.Home, completion: @escaping () -> Void) {
            let favorite = localDBManage.favorite
            
            if favorite.contains(model) {
                localDBManage.remove(item: model)
            }else {
                localDBManage.add(item: model)
            }
            
            self.model.favorite = localDBManage.favorite
            
            if let index = self.model.list.firstIndex(where: { $0 == model }) {
                let isFav = self.model.list[index].isFavorite
                self.model.list[index].isFavorite = !(isFav)
            }
            
            completion()
            
        }
    }
}

enum AppError: Error {
    case tryAgain
}
