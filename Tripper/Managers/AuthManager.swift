//
//  AuthManager.swift
//  Tripper
//
//  Created by Margulan Daribayev on 03.06.2021.
//

import Foundation

/** Class should utilize Firebase storage and do other checks.
For now, it's just dummy one
 */

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var userIsSignedIn: Bool = false
}
