//
//  CovidStatisticListViewModel.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import Foundation

final class CovidStatisticListViewModel: BaseViewModel {
    var result: [CovidResult]?
    var coordinator: CovidStatisticListCoordinator?
    
    func fetchCovidData(completion: @escaping (Bool) ->()) {
        API.fetch(endPoint: "corona/countriesData/") { (covidData: Result<CovidData,Error>) in
            switch covidData {
            case .success(let covidData):
                self.result = covidData.result
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return result?.count ?? 0
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishListing()
    }
}
