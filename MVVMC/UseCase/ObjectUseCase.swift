//
//  ObjectUseCase.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation

class ObjectUseCase: ObjectUseCaseProtocol {
    private let objectRepository: ObjectRepositoryProtocol
    
    init(objectRepository: ObjectRepositoryProtocol) {
        self.objectRepository = objectRepository
    }
    
    func fetchObjects(completion: @escaping (Result<[Object], Error>) -> Void) {
        objectRepository.fetchObjects(completion: completion)
    }
}
