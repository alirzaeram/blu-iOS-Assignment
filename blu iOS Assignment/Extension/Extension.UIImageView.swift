//
//  Extension.UIImageView.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit
import NetworkManger

extension UIImageView {
    func load(_ uri: String) {
        guard let url: URL = .init(string: uri) else {
            self.image = nil
            self.backgroundColor = .lightGray
            return
        }
        
        ImageLoader.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}


