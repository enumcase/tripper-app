//
//  Trip.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import Foundation

struct Trip: Codable, Hashable {
    var season: String //Season
    let name: String
    let year: Int
    let duration: Int?
    //let followers: [[Follower]]
    let image: String
}
