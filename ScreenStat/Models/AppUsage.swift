//
//  AppUsage.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import Foundation

struct AppUsage: Codable {
    let appName: String
    let usageTime: TimeInterval
    let timestamp: Date
}
