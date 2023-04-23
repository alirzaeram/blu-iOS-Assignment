//
//  ViewController.Home + UICollectionViewDelegate.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

extension ViewController.Home: UICollectionViewDelegate {
    
}

extension ViewController.Home: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return .zero }
        
        switch indexPath.section {
        case 0:
            return viewModel.model.favorite.count >= 0 ? .init(width: collectionView.frame.width, height: 140) : .zero
        case 1:
            return .init(width: collectionView.bounds.width, height: Theme.Constraint.listHeight)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let viewModel = self.viewModel as? ViewModel.Home else { return .zero }
        switch section {
        case 0:
            if viewModel.model.favorite.isEmpty {
                return .zero
            }else {
                return .init(width: collectionView.bounds.width, height: 50)
            }
            
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 50)
            
        default:
            return .zero
        }
    }
}
