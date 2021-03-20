//
//  Trip.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import Foundation

struct Trip: Codable, Hashable {
    let season: String
    let name: String
    let year: Int
    let duration: Int?
    let follower: [Follower]
    let image: String
}
