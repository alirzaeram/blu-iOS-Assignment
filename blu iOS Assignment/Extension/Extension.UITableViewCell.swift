//
//  Extension.UITableViewReusableView.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/26/23.
//

import UIKit

extension UITableViewCell {
    static public func registerIdentifier() -> String {
        String(describing: self.self)
    }
}
