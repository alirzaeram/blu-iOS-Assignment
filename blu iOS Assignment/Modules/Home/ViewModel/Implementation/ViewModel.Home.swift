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
        var currentPagination: Int
        var model: Model.List
        
        // Protocol object of network manager object
        var networkManage: any NetworkManagerProtocol
        // Singleton object of local db manager object
        var localDBManage: AppStorage
        
        var networkItems: [RemoteModelHomeProtocol] = [Model.Home]()
        var delegate: HomeViewProtocol?
        
        init() {
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
                guard let networkResult else {
                    completion(.failure(AppError.tryAgain))
                    return
                }
                
                completion(.success(.init(favorite: dbResult, list: networkResult)))
            }
        }
        
        private func mapModels(_ remote: [RemoteModelHomeProtocol]) -> [Model.Home] {
            return remote.map {
                .init(isFavorite: false, person: $0.person, card: $0.card, lastTransfer: $0.lastTransfer, note: $0.note, moreInfo: $0.moreInfo)
            }
        }
    }
}

enum AppError: Error {
    case tryAgain
}
