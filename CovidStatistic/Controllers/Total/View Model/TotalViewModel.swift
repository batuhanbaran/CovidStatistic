//
//  TotalViewModel.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation

class TotalViewModel {
    var coordinator: TotalCoordinator?
    var result: TotalResult?
    
    func fetchTotalData(completion: @escaping (Bool) ->()) {
        API.fetch(endPoint: "corona/totalData") { (total: Result<Total,Error>) in
            switch total {
            case .success(let total):
                self.result = total.result
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishTotalListing()
    }
}
