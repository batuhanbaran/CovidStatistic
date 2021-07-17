//
//  CovidNewsViewModel.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation

class CovidNewsViewModel {
    
    var coordinator: CovidNewsCoordinator?
    var response: [CovidNewsResult]?
    
    func fetchCovidNews(completion: @escaping (Bool) -> Void) {
        API.fetch(endPoint: "corona/coronaNews") { (covidNews: Result<CovidNews,Error>) in
            switch covidNews {
            case .success(let covidNews):
                self.response = covidNews.result
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return response?.count ?? 0
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishCovidNewListing()
    }
}
