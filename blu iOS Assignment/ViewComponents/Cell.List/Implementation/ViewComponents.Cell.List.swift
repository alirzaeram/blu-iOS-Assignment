//
//  ViewComponents.Cell.List.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

extension ViewComponents.Cell {
    
    class List: UICollectionViewCell {
        
        var model: Model.Home? {
            didSet {
                guard let model else { return }
                nameLabel.text = model.person.fullName
                identifierLabel.text = model.card.cardNumber
                avatarImageView.load(model.person.avatar)
                
                let imageFill: UIImage = .init(named: "star fill") ?? .init()
                let imageEmpty: UIImage = .init(named: "star empty") ?? .init()
                favoriteButton.setImage(model.isFavorite ?? false ? imageFill : imageEmpty, for: .normal)
                favoriteButton.tintColor = model.isFavorite ?? false ? .orange : .lightGray
            }
        }
        
        weak var delegate: CellListDelegate?
        
        lazy var hStack: StackView.Horizontal = {
            let view: StackView.Horizontal = .init()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.spacing = 8.0
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
        
        lazy var vStack: UIStackView = {
            let view: UIStackView = .init(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.distribution = .fillEqually
            view.axis = .vertical
            view.alignment = .fill
            view.spacing = 0.0
            return view
        }()
        
        lazy var nameLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.font = .boldSystemFont(ofSize: 14.0)
            view.textColor = .black
            return view
        }()
        
        lazy var identifierLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.font = .systemFont(ofSize: 12.0)
            view.textColor = .black
            return view
        }()
        
        lazy var favoriteButton: UIButton = {
            let view: UIButton = .init(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            let imageSize = CGSize(width: 15.0, height: 15.0)
            view.imageView?.frame = CGRect(origin: .zero, size: imageSize)
            view.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
            return view
        }()
        
        lazy var rightChevronIcon: UIImageView = {
            let icon: UIImage = .init(named: "chevron.right") ?? .init()
            let view: UIImageView = .init(image: icon)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFit
            view.clipsToBounds = true
            view.tintColor = .gray
            return view
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(hStack)
            
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
            avatarImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
            avatarImageView.layer.cornerRadius = 40.0
            hStack.addArrangedSubview(avatarImageView, fillMode: .CenterY)
            
            hStack.addArrangedSubview(vStack)
            
            vStack.addArrangedSubview(nameLabel)
            vStack.addArrangedSubview(identifierLabel)
            
            favoriteButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            favoriteButton.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
            hStack.addArrangedSubview(favoriteButton, fillMode: .CenterY)
            
            rightChevronIcon.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
            rightChevronIcon.widthAnchor.constraint(equalTo: rightChevronIcon.heightAnchor).isActive = true
            hStack.addArrangedSubview(rightChevronIcon, fillMode: .CenterY)
            
            
            let tap: UITapGestureRecognizer = .init(target: self, action: #selector(didSelectCell))
            contentView.addGestureRecognizer(tap)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc private func didTapFavorite() {
            guard let delegate,
                  let model else { return }
            delegate.didSelectFavorite(self, with: model)
        }
        
        @objc private func didSelectCell() {
            guard let delegate,
                  let model else { return }
            delegate.didSelectCell(self, with: model)
        }
    }
}
