//
//  ViewController.Detail + UITableViewDataSource.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/26/23.
//

import UIKit

extension ViewController.Detail: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel as? ViewModel.Detail else { return 0 }
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel as? ViewModel.Detail else { return .init() }
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewComponents.Cell.KeyValueView.registerIdentifier(), for: indexPath) as! ViewComponents.Cell.KeyValueView
        cell.model = viewModel.dataSource[indexPath.row]
        return cell
    }
    
    
}
