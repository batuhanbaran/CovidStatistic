//
//  TotalCoordinator.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import Foundation
import UIKit

final class TotalCoordinator: Coordinator {
    weak var parentCoordinator: HomeCoordinator? 
    var childCoordinators: [Coordinator] = []
    
    var navigationContoller: UINavigationController
    
    init(navigationContoller: UINavigationController) {
        self.navigationContoller = navigationContoller
    }
    
    func start() {
        let totalViewController = TotalViewController(nibName: "TotalViewController", bundle: nil)
        totalViewController.coordinator = self
        let viewModel = TotalViewModel()
        totalViewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationContoller.pushViewController(totalViewController, animated: true)
    }
    
    func didFinishTotalListing() {
        parentCoordinator?.childDidFinish(self)
    }
}
