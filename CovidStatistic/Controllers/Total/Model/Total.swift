//
//  Total.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation

struct Total: Codable {
    let success: Bool
    let result: TotalResult
}

struct TotalResult: Codable {
    let totalDeaths: String
    let totalCases: String
    let totalRecovered: String
}
