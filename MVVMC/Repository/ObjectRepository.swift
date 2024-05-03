//
//  ObjectRepository.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation
import UIKit

class ObjectRepository: ObjectRepositoryProtocol {
    func fetchObjects(completion: @escaping (Result<[Object], Error>) -> Void) {
        // Implement fetching objects from the API using URLSession
        guard let url = URL(string: "https://api.restful-api.dev/objects") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let objects = try decoder.decode([Object].self, from: data)
                completion(.success(objects))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
