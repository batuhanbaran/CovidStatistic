//
//  HomeViewModel.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import Foundation

class HomeViewModel {
    
    var titles = [
        "Countries Data",
        "Total Data",
        "Corona News",
        "Continent Data",
    ]
    
    var subTitles = [
        "Corona values recorded so far by country",
        "Total recorded corona values",
        "News about Corona Virus on Turkey's agenda",
        "Corona values recorded so far by continents",
    ]
    
    var menu: Menu!
    var coordinator: HomeCoordinator?
    
    func numberOfItems() -> Int {
        return titles.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> String {
        return titles[indexPath.row]
    }
    
    func tappedMenu(menu: Menu) {
        if menu == .list {
            coordinator?.covidStaticList()
        }
    }
    
}
