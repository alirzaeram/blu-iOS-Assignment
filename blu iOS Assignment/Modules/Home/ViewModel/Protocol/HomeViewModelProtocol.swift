//
//  HomeViewModelProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/21/23.
//

import Foundation
import NetworkManger

protocol HomeViewModelProtocol {
    var networkManage: any NetworkManagerProtocol { get }
    var localDBManage: AppStorage { get }
    var networkItems: [Model.Home] { get }
    func shouldFetch(_ next: Bool)
}

