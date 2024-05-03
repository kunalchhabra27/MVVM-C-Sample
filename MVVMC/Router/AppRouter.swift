//
//  AppRouter.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation
import UIKit

class AppRouter {
    static func createInitialViewController() -> UINavigationController {
        let navigationController = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator.start()
        return navigationController
    }
}
