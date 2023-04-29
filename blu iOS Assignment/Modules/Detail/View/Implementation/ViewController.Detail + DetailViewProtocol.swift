//
//  ViewController.Detail + DetailViewProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import Foundation

extension ViewController.Detail: DetailViewProtocol {
    func shouldShowError(_ viewModel: DetailViewModelProtocol, with error: Error) {
        
    }
    
    func shouldShowDetail(_ viewModel: DetailViewModelProtocol, with model: Model.Home, with array: [Model.KeyValue]) {
        self.tableView.reloadData()
    }
}
