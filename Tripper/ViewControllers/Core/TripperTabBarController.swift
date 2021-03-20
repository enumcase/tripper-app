//
//  TripperTabBarController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripperTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .systemBlue
        
        let tripsVC = TripsViewController()
        let createTripVC = CreateTripViewController()
        let bookmarksVC = BookmarksViewController()
        let settingsVC = SettingsViewController()
        
        tripsVC.title = "My Trips"
        createTripVC.title = "Create Trip"
        bookmarksVC.title = "Bookmarks"
        settingsVC.title = "Settings"
        
        tripsVC.navigationItem.largeTitleDisplayMode = .always
        createTripVC.navigationItem.largeTitleDisplayMode = .always
        bookmarksVC.navigationItem.largeTitleDisplayMode = .always
        settingsVC.navigationItem.largeTitleDisplayMode = .always
        
        let tripsNC = UINavigationController(rootViewController: tripsVC)
        let createTripNC = UINavigationController(rootViewController: createTripVC)
        let bookmarksNC = UINavigationController(rootViewController: bookmarksVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        tripsNC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        createTripNC.tabBarItem = UITabBarItem(title: "Create trip", image: UIImage(systemName: "plus.circle"), tag: 1)
        bookmarksNC.tabBarItem = UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "bookmark"), tag: 2)
        settingsNC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 3)
        
        tripsNC.navigationBar.prefersLargeTitles = true
        createTripNC.navigationBar.prefersLargeTitles = true
        bookmarksNC.navigationBar.prefersLargeTitles = true
        settingsNC.navigationBar.prefersLargeTitles = true
        
        viewControllers = [tripsNC, createTripNC, bookmarksNC, settingsNC]
    }
    

}
