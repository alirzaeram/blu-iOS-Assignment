//
//  CellListDelegate.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

protocol CellListDelegate: AnyObject {
    func didSelectCell(_ cell: UICollectionViewCell, with model: Model.Home)
    func didSelectFavorite(_ cell: UICollectionViewCell, with model: Model.Home)
}
