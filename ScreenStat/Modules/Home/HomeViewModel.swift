//
//  HomeViewModel.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import Foundation

protocol HomeViewModelProtocol {
    var title: String { get }
    var records: [AppUsage] { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {
    let title: String = "ScreenStat"
    var records: [AppUsage] = []
    
    private let storageService: AppUsageStorageServiceProtocol
    
    init(storageService: AppUsageStorageServiceProtocol) {
        self.storageService = storageService
        
        let usage = AppUsage(appName: "WhatsApp", usageTime: 600, timestamp: Date())
        storageService.save(usage)
    }
    
    func loadData() {
        self.records = storageService.load()
    }
}
