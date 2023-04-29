//
//  ViewComponents.Cell.Fav.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewComponents.Cell {
    class FavoriteCollection: UICollectionViewCell {
        var model: [Model.Home] = [] {
            didSet {
                collectionView.reloadData()
            }
        }
        
        lazy var collectionView: UICollectionView = {
            let layout: UICollectionViewFlowLayout = .init()
            layout.scrollDirection = .horizontal
            let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
            view.register(ViewComponents.Cell.Favorite.self, forCellWithReuseIdentifier: ViewComponents.Cell.Favorite.registerIdentifier())
            
            view.showsHorizontalScrollIndicator = false
            view.delegate = self
            view.dataSource = self
            view.isUserInteractionEnabled = true
            
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(collectionView)
            collectionView.alignAllEdgesWithSuperview(.equalSide(8.0))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension ViewComponents.Cell.FavoriteCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 100.0, height: collectionView.frame.height)
    }
}

extension ViewComponents.Cell.FavoriteCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewComponents.Cell.Favorite.registerIdentifier(), for: indexPath) as! ViewComponents.Cell.Favorite
        cell.model = model[indexPath.item]
        return cell
    }
    
    
}
