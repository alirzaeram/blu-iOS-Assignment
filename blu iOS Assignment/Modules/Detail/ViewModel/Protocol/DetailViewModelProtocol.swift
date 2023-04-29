//
//  DetailViewModelProtocol.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/24/23.
//

import Foundation
import NetworkManger

protocol DetailViewModelProtocol{
    var localDBManage: AppStorage { get }
    var model: Model.Home { get }
}
