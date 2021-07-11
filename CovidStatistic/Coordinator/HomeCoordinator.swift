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
        navigationContoller.setViewControllers([homeViewController], animated: false)
    }
    
}
