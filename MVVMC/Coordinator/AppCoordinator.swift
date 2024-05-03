//
//  AppCoordinator.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation
import UIKit

class AppCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let objectListVC = ObjectListViewController()
        objectListVC.coordinator = self
        navigationController.pushViewController(objectListVC, animated: false)
    }
    
    func showObjectDetail(object: Object) {
        let detailVC = ObjectDetailViewController(object: object)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
