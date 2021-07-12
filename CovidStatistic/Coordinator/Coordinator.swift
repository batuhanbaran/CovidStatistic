//
//  Coordinator.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 9.07.2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    var navigationContoller: UINavigationController { get }
    
    func start()
}
