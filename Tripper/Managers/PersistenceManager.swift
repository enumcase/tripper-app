//
//  PersistenceManager.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let bookmarks = "bookmarks"
    }
    
    static func updateWith(bookmarkedTrip: Trip, actionType: PersistenceActionType, completion: @escaping (RequestError?) -> Void) {
        retrieveBookmarks { result in
            switch result {
            case .success(let favorites):
                var retrievedBookmarks = favorites
                switch actionType {
                case .add:
                    guard !retrievedBookmarks.contains(bookmarkedTrip) else {
                        completion(.alreadyInBookmarks)
                        return
                    }
                    retrievedBookmarks.append(bookmarkedTrip)
                case .remove:
                    retrievedBookmarks.removeAll { $0.hashValue == bookmarkedTrip.hashValue }
                }
                completion(save(bookmarkedTrips: retrievedBookmarks))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func retrieveBookmarks(completion: @escaping (Result<[Trip], RequestError>) -> Void) {
        guard let bookmarksData = defaults.object(forKey: Keys.bookmarks) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let bookmarkedTrips = try decoder.decode([Trip].self, from: bookmarksData)
            completion(.success(bookmarkedTrips))
        } catch {
            completion(.failure(.unableToBookmark))
        }
    }
    
    
    static func save(bookmarkedTrips: [Trip]) -> RequestError? {
        do {
            let encoder = JSONEncoder()
            let encodedBookmarks = try encoder.encode(bookmarkedTrips)
            defaults.setValue(encodedBookmarks, forKey: Keys.bookmarks)
            return nil
        } catch {
            return .unableToBookmark
        }
    }
    
}
