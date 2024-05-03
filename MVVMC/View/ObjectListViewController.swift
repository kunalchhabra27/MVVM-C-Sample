//
//  ObjectListViewController.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation
import UIKit

class ObjectListViewController: UIViewController {
    var viewModel: ObjectViewModel!
    var tableView: UITableView!
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Objects"

        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        // Add constraints for tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        viewModel = ObjectViewModel(objectUseCase: ObjectUseCase(objectRepository: ObjectRepository()))
        fetchObjects()
    }

    func fetchObjects() {
        viewModel.fetchObjects { error in
            if let error = error {
                // Handle error
                print("Error fetching objects: \(error.localizedDescription)")
            } else {
                // Reload table view on main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ObjectListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = viewModel.objects[indexPath.row]
        cell.textLabel?.text = "\(object.id): \(object.name)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = viewModel.objects[indexPath.row]
        coordinator?.showObjectDetail(object: object)
    }
}
