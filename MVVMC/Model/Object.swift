//
//  Object.swift
//  MVVMC
//
//  Created by Kunal Chhabra on 03/05/24.
//

import Foundation

struct Object: Codable {
    let id: String
    let name: String
    // Add other properties as required
    let data: ProductData?
}

struct ProductData: Codable {
    let color: String?
    let capacity: String?
    let price: Double?
    let generation: String?
    let capacityGB: Int?
    let strapColour: String?
    let caseSize: String?
    let description: String?
    let screenSize: Double?
    let year: Int?
    let cpuModel: String?
    let hardDiskSize: String?
}
