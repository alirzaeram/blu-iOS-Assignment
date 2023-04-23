//
//  ViewController.Home + UICollectionViewDatasource.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

extension ViewController.Home: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return 0 }
        switch section {
        case 0:
            return viewModel.model.favorite.count > 0 ? 1 : 0
        case 1:
            return viewModel.model.list.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return .init() }
        
        switch indexPath.section {
        case 0:
            let data = viewModel.model.favorite
            return makeFavoriteCell(withModel: data, cellForItemAt: indexPath)
        case 1:
            let data = viewModel.model.list[indexPath.item]
            return self.makeListCell(withModel: data, cellForItemAt: indexPath)
        default:
            return .init()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let viewModel = self.viewModel as? ViewModel.Home else { return  }
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: ViewComponents.Header.Title.registerIdentifier(),
                                                                   for: indexPath) as! ViewComponents.Header.Title
        
        if indexPath.section == 0 {
            cell.label.text = "Favorite"
        }else {
            cell.label.text = "All"
        }
        return cell
    }
    
}

extension ViewController.Home {
    private func makeListCell(withModel model: Model.Home, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewComponents.Cell.List.registerIdentifier(),
                                                      for: indexPath) as! ViewComponents.Cell.List
        cell.model = model
        cell.delegate = self
        return cell
    }
    
    private func makeFavoriteCell(withModel model: [Model.Home], cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewComponents.Cell.FavoriteCollection.registerIdentifier(), for: indexPath) as! ViewComponents.Cell.FavoriteCollection
        cell.model = model
        return cell
    }
}
