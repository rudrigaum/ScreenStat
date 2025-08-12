//
//  AppUsageStorageService.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import Foundation

protocol AppUsageStorageServiceProtocol {
    func save(_ usage: AppUsage)
    func load() -> [AppUsage]
}

class AppUsageUserDefaultsService: AppUsageStorageServiceProtocol {
    private let key = "appUsageRecords"

    func save(_ usage: AppUsage) {
        var records = load()
        records.append(usage)

        if let encodedData = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }

    func load() -> [AppUsage] {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decodedRecords = try? JSONDecoder().decode([AppUsage].self, from: savedData) {
            return decodedRecords
        }
        return []
    }
}
