//
//  CovidStatisticList.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import Foundation

// MARK: - CovidData
struct CovidData: Codable {
    let success: Bool
    let result: [CovidResult]
}

// MARK: - Result
struct CovidResult: Codable {
    let country: String
    let totalCases: String
    let newCases: String
    let totalDeaths: String
    let newDeaths: String
    let totalRecovered: String
    let activeCases: String
}
