//
//  CovidNews.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation

struct CovidNews: Codable {
    let success: Bool
    let result: [CovidNewsResult]
}

struct CovidNewsResult: Codable {
    let image: String
    let description: String
    let name: String
    let source: String
    let date: String
}
