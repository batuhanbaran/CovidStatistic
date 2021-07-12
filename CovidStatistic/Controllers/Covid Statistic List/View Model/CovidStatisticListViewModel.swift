//
//  CovidStatisticListViewModel.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import Foundation

class CovidStatisticListViewModel {
    var result: [CovidResult]?
    
    func fetchCovidData(completion: @escaping (Bool) ->()) {
        API.fetch(endPoint: "corona/countriesData/", httpMethod: .get) { (covidData: Result<CovidData,Error>) in
            switch covidData {
            case .success(let covidData):
                self.result = covidData.result
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return result?.count ?? 0
    }
}
