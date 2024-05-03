//
//  ObjectDetailViewController.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation
import UIKit

class ObjectDetailViewController: UIViewController {
    var object: Object
    var colorLabel: UILabel!
    var capacityLabel: UILabel!

    init(object: Object) {
        self.object = object
        super.init(nibName: nil, bundle: nil)
        title = "Object Details"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        colorLabel = UILabel()
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorLabel)

        capacityLabel = UILabel()
        capacityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(capacityLabel)

        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            capacityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            capacityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])

        if let data = object.data {
            if let color = data.color {
                colorLabel.text = "Color: \(color)"
            } else {
                colorLabel.text = "No color available"
            }

            if let capacity = data.capacity {
                capacityLabel.text = "Capacity: \(capacity)"
            } else {
                capacityLabel.text = "No capacity available"
            }
        } else {
            colorLabel.text = "No data available"
            capacityLabel.text = "No data available"
        }
    }
}
