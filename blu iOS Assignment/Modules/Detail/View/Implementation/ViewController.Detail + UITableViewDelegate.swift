//
//  ViewController.Detail + UITableViewDelegate.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/26/23.
//

import UIKit

extension ViewController.Detail: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
