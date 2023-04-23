//
//  ViewComponent.Header.Title.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewComponents.Header {
    class Title: UICollectionReusableView {
        
        lazy var label: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = .black
            view.font = .boldSystemFont(ofSize: 22.0)
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(label)
            label.alignAllEdgesWithSuperview(.equalSide(16.0))
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
