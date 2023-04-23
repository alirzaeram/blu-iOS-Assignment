//
//  Extension.UIView.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

extension UIView {
    
    public func alignAllEdgesWithSuperview(_ edge: UIEdgeInsets = .zero) {
        guard let superview else { fatalError("\(Self.description()) does not have any superview!") }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: edge.left).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edge.top).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: edge.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: edge.bottom).isActive = true
        
    }
}
