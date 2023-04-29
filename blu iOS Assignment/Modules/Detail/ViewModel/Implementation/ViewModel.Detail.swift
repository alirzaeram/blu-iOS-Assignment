//
//  ViewModel.Detail.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import Foundation
import NetworkManger

extension ViewModel {
    class Detail: DetailViewModelProtocol {
        var localDBManage: AppStorage
        
        var model: Model.Home
        var dataSource: [Model.KeyValue] = []
        
        weak var delegate: DetailViewProtocol?
        
        init(model: Model.Home) {
            self.localDBManage = .shared
            self.model = model
        }
        
        func fetch() {
            guard let delegate else { return }
            var array: [Model.KeyValue] = [
                .init(key: "Name", value: model.person.fullName),
                .init(key: "Card Number", value: model.card.cardNumber),
                .init(key: "Card Type", value: model.card.cardType),
                .init(key: "Number of Transfers", value: "\(model.moreInfo.numberOfTransfers)"),
                .init(key: "Total Transfer", value: "\(model.moreInfo.totalTransfer)")
            ]
            
            if let email = model.person.email {
                array.insert(.init(key: "Email", value: email), at: 1)
            }
            
            if let note = model.note {
                array.append(.init(key: "Note", value: note))
            }
            
            self.dataSource = array
            
            delegate.shouldShowDetail(self, with: model, with: self.dataSource)
        }
        
    }
}
