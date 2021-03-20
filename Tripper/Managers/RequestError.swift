//
//  NetworkManagerError.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import Foundation

enum RequestError: String, Error {
    // Network manager error messages
    case invalidURL = "The provided URL for fetching data is invalid."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    
    // Persistence manager error messages
    case unableToBookmark = "There was an error bookmarking the trip. Please try again."
    case alreadyInBookmarks = "This trip is already in bookmarks."
}
