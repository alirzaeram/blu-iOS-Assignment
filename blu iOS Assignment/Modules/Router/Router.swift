//
//  Router.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/23/23.
//

import UIKit

internal final class Router {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func navigateToHome() {
        let viewModel: ViewModel.Home = .init(router: self)
        let homeVC = ViewController.Home()
        homeVC.viewModel = viewModel
        viewModel.delegate = homeVC
        self.navigationController.viewControllers = [homeVC]
    }
    
    func navigateToDetail(_ model: Model.Home) {
        
    }
    
}
