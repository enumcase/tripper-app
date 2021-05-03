//
//  BookmarksViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class BookmarksViewController: DataLoadingViewController {

    private var bookmarkedTrips: [Trip] = []
    
    private lazy var bookmarkedTripsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TripCardCell.self, forCellReuseIdentifier: TripCardCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let topMenuBar: TopMenuBarStackView = {
        let menuBar = TopMenuBarStackView()
        return menuBar
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        view.addSubview(topMenuBar)
        view.addSubview(bookmarkedTripsTableView)
        
        setTopMenuBarConstraints()
        setBookmarkedTripsTableViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBookmarkedTrips()
    }
    
    private func getBookmarkedTrips() {
        PersistenceManager.retrieveBookmarks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let bookmarkedTrips):
                if bookmarkedTrips.isEmpty {
                    DispatchQueue.main.async {
                        self.showEmptyStateView(in: self.view)
                    }
                } else {
                    self.bookmarkedTrips = bookmarkedTrips
                    DispatchQueue.main.async {
                        self.bookmarkedTripsTableView.reloadData()
                        self.view.bringSubviewToFront(self.bookmarkedTripsTableView)
                    }
                }
                
            case .failure(let error):
                self.PresentAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
        
    }
    
    /// Constraints
    private func setTopMenuBarConstraints() {
        NSLayoutConstraint.activate([
            topMenuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setBookmarkedTripsTableViewConstraints() {
        let padding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            bookmarkedTripsTableView.topAnchor.constraint(equalTo: topMenuBar.bottomAnchor, constant: -4),
            bookmarkedTripsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookmarkedTripsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bookmarkedTripsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

/// Table View Delegate Methods

extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookmarkedTrips.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripCardCell.reuseIdentifier, for: indexPath) as! TripCardCell
        let trip = bookmarkedTrips[indexPath.section]
        cell.setCardData(for: trip)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
}
