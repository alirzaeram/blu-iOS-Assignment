//
//  ViewController.Home + CellListDelegate.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewController.Home: CellListDelegate {
    func didSelectCell(_ cell: UICollectionViewCell, with model: Model.Home) {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return }
        viewModel.navigateDetail(model)
    }
    
    func didSelectFavorite(_ cell: UICollectionViewCell, with model: Model.Home) {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return }
        viewModel.shouldChangeFavorite(model) {
            for item in viewModel.model.list.enumerated() {
                if model == item.element {
                    let cellIndex: IndexPath = .init(item: item.offset, section: 1)
                    let favIndex: IndexPath = .init(item: 0, section: 0)
                    self.collectionView.reloadItems(at: [cellIndex, favIndex])
                }
            }
        }
    }
}
