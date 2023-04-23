//
//  ViewComponents.Cell.Favorite.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewComponents.Cell {
    class Favorite: UICollectionViewCell {
        
        var model: Model.Home? {
            didSet {
                guard let model else { return }
                nameLabel.text = model.person.fullName
                identifierLabel.text = model.card.cardNumber
                avatarImageView.load(model.person.avatar)
            }
        }
        
        lazy var vStack: StackView.Vertical = {
            let view: StackView.Vertical = .init()
            view.spacing = 4.0
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        lazy var avatarImageView: UIImageView = {
            let view: UIImageView = .init(image: nil)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFit
            view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
            view.layer.borderWidth = 1.0
            return view
        }()
        
        lazy var nameLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.font = .boldSystemFont(ofSize: 12.0)
            view.textAlignment = .center
            view.textColor = .black
            return view
        }()
        
        lazy var identifierLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.font = .systemFont(ofSize: 10.0)
            view.textAlignment = .center
            view.textColor = .black
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(vStack)
            vStack.alignAllEdgesWithSuperview()
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
            avatarImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
            avatarImageView.layer.cornerRadius = 40.0
            vStack.addArrangedSubview(avatarImageView, fillMode: .CenterX)
            
            vStack.addArrangedSubview(nameLabel)
            vStack.addArrangedSubview(identifierLabel)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }
}
