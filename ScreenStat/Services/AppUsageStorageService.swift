//
//  AppUsageStorageService.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import Foundation

protocol FocusSessionStorageServiceProtocol {
    func save(_ session: FocusSession)
    func load() -> [FocusSession]
}

class FocusSessionUserDefaultsService: FocusSessionStorageServiceProtocol {
    private let key = "focusSessionRecords"

    func save(_ session: FocusSession) {
        var records = load()
        records.append(session)

        if let encodedData = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }

    func load() -> [FocusSession] {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decodedRecords = try? JSONDecoder().decode([FocusSession].self, from: savedData) {
            return decodedRecords
        }
        return []
    }
}
