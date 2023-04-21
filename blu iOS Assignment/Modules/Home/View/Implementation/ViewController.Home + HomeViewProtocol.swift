//
//  ViewController.Home + HomeViewProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import UIKit

extension ViewController.Home: HomeViewProtocol {
    func shouldShowList(_ viewModel: HomeViewModelProtocol, with model: Model.List) {
        
    }
    
    func shouldShowError(_ viewModel: HomeViewModelProtocol, with error: Error) {
        
    }
    
    func shouldShowError(_ viewController: UIViewController, with error: Error) {
        
    }
    
    func shouldShowList(_ viewController: UIViewController, with model: [Model.List]) {
        
    }
}
