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
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.viewModel.shouldFetch()
        }
    }
}

