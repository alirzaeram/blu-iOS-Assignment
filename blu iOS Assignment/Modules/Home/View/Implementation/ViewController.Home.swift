//
//  HomeController.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import UIKit

extension ViewController {
    class Home: UIViewController {
        
        var viewModel: HomeViewModelProtocol!
        
        lazy var collectionView: UICollectionView = {
            let layout: UICollectionViewFlowLayout = .init()
            let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
            view.register(ViewComponents.Cell.List.self,
                          forCellWithReuseIdentifier: ViewComponents.Cell.List.registerIdentifier())
            view.register(ViewComponents.Cell.FavoriteCollection.self,
                          forCellWithReuseIdentifier: ViewComponents.Cell.FavoriteCollection.registerIdentifier())
            view.register(ViewComponents.Header.Title.self,
                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                          withReuseIdentifier: ViewComponents.Header.Title.registerIdentifier())
            
            view.delegate = self
            view.dataSource = self
            
            return view
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(collectionView)
            self.collectionView.alignAllEdgesWithSuperview()
            
            self.viewModel.shouldFetch(true)
        }
    }
}

