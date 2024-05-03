//
//  ObjectRepositoryProtocol.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation

protocol ObjectRepositoryProtocol {
    func fetchObjects(completion: @escaping (Result<[Object], Error>) -> Void)
}
