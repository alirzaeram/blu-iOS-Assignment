//
//  ViewController.Detail.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

extension ViewController {
    class Detail: UIViewController {
        var viewModel: DetailViewModelProtocol!
        
        lazy var tableView: UITableView = {
            let view: UITableView = .init(frame: .zero, style: .plain)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.register(ViewComponents.Cell.KeyValueView.self, forCellReuseIdentifier: ViewComponents.Cell.KeyValueView.registerIdentifier())
            view.delegate = self
            view.dataSource = self
            return view
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            view.addSubview(tableView)
            tableView.alignAllEdgesWithSuperview(.equalSide(16.0))
            
            guard let viewModel = viewModel as? ViewModel.Detail else { return }
            viewModel.fetch()
        }
    }
}
