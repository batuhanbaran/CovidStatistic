//
//  CovidNewCoordinator.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation
import UIKit

class CovidNewsCoordinator: Coordinator {
    var parentCoordinator: HomeCoordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationContoller: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationContoller = navigationController
    }
    
    func start() {
        let covidNewsViewController = CovidNewsViewController(nibName: "CovidNewsViewController", bundle: nil)
        covidNewsViewController.coordinator = self
        let viewModel = CovidNewsViewModel()
        covidNewsViewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationContoller.pushViewController(covidNewsViewController, animated: true)
    }
    
    func didFinishCovidNewListing() {
        parentCoordinator?.childDidFinish(self)
    }
}
