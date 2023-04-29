//
//  View.KeyValueView.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewComponents.Cell {
    class KeyValueView: UITableViewCell {
        
        var model: Model.KeyValue? {
            didSet {
                guard let model else { return }
                keyLabel.text = model.key
                valueLabel.text = model.value
            }
        }
        
        lazy var keyLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = .black
            view.font = .boldSystemFont(ofSize: 14.0)
            return view
        }()
        
        lazy var valueLabel: UILabel = {
            let view: UILabel = .init(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = .black
            view.font = .systemFont(ofSize: 14.0)
            return view
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(keyLabel)
            contentView.addSubview(valueLabel)
            
            keyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            
            keyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            
            keyLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
            valueLabel.leadingAnchor.constraint(equalTo: keyLabel.trailingAnchor).isActive = true
            
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
