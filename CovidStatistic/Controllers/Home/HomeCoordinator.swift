//
//  HomeCoordinator.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 9.07.2021.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationContoller: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationContoller = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let viewModel = HomeViewModel()
        homeViewController.viewModel = viewModel
        viewModel.coordinator = self
        homeViewController.title = "Covid Statistic"
        navigationContoller.setViewControllers([homeViewController], animated: false)
    }
    
    func covidStaticList() {
        let covidStatisticListCoordinator = CovidStatisticListCoordinator(navigationController: navigationContoller)
        childCoordinators.append(covidStatisticListCoordinator)
        covidStatisticListCoordinator.parentCoordinator = self
        covidStatisticListCoordinator.start()
    }
    
    func total() {
        let totalCoordinator = TotalCoordinator(navigationContoller: navigationContoller)
        childCoordinators.append(totalCoordinator)
        totalCoordinator.parentCoordinator = self
        totalCoordinator.start()
    }
    
    func covidNews() {
        let covidNewCoordinator = CovidNewsCoordinator(navigationController: navigationContoller)
        childCoordinators.append(covidNewCoordinator)
        covidNewCoordinator.parentCoordinator = self
        covidNewCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
