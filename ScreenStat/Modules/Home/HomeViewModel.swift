//
//  HomeViewModel.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import Foundation

protocol HomeViewModelProtocol {
    var title: String { get }
}

class HomeViewModel: HomeViewModelProtocol {
    let title: String = "ScreenStat"
}
