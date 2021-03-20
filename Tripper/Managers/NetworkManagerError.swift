//
//  NetworkManagerError.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import Foundation

enum NetworkManagerError: String, Error {
    case invalidURL = "The provided URL for fetching data is invalid."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
