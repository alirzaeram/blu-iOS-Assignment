//
//  Extension.CollectionViewCell.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

extension UICollectionReusableView {
    static public func registerIdentifier() -> String {
        String(describing: self.self)
    }
}
