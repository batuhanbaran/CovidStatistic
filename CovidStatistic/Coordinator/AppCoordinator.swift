//
//  AppCoordinator.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 9.07.2021.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationContoller: UINavigationController
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.navigationContoller = UINavigationController()
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationContoller)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }

}
