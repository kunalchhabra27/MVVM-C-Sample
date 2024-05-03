//
//  ObjectViewModel.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation

class ObjectViewModel {
    private let objectUseCase: ObjectUseCaseProtocol
    var objects: [Object] = []
    
    init(objectUseCase: ObjectUseCaseProtocol) {
        self.objectUseCase = objectUseCase
    }
    
    func fetchObjects(completion: @escaping (Error?) -> Void) {
        objectUseCase.fetchObjects { result in
            switch result {
            case .success(let objects):
                self.objects = objects
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
