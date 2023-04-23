//
//  Extension.UIEdgeInsets.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension UIEdgeInsets {
    
    static func adjust(_ insets: UIEdgeInsets, dT: CGFloat = 0, dL: CGFloat = 0, dB: CGFloat = 0, dR: CGFloat = 0) -> UIEdgeInsets {
        .init(top: insets.top + dT, left: insets.left + dL, bottom: insets.bottom + dB, right: insets.right + dR)
    }
    
    static func top(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: inset, left: 0, bottom: 0, right: 0)
    }
    
    static func bottom(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: inset, right: 0)
    }
    
    static func left(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: inset, bottom: 0, right: 0)
    }
    
    static func right(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: inset)
    }
    
    static func allExceptTop(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: inset, bottom: inset, right: inset)
    }
    
    static func allExceptBottom(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: inset, left: inset, bottom: 0, right: inset)
    }
    
    static func equal(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    static func side(left: CGFloat, right: CGFloat) -> UIEdgeInsets {
        return .init(top: 0, left: left, bottom: 0, right: right)
    }
    
    static func equalSide(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    static func topAndBottom(top: CGFloat, bottom: CGFloat) -> UIEdgeInsets {
        .init(top: top, left: 0, bottom: bottom, right: 0)
    }
    
    static func equalTopAndBottom(_ inset: CGFloat) -> UIEdgeInsets {
        .init(top: inset, left: 0, bottom: inset, right: 0)
    }
}
