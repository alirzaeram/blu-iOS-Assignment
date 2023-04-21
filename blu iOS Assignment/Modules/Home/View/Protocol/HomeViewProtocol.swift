//
//  HomeViewProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func shouldShowError(_ viewModel: HomeViewModelProtocol, with error: Error)
    func shouldShowList(_ viewModel: HomeViewModelProtocol, with model: Model.List)
}
