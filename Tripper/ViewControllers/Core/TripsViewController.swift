//
//  TripsViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripsViewController: UIViewController {
    // Data for testing purposes
    var followers: [Follower] = [
        Follower(id: 1, name: "Anime", profileImage: "anime"),
        Follower(id: 2, name: "Kayden", profileImage: "kayden")
    ]
    
    lazy var trips: [Trip] = [
        Trip(season: .spring, location: "Kyoto", year: 2021, duration: 14, followers: followers, image: "japan"),
        Trip(season: .summer, location: "Nur-Sultan", year: 2021, duration: 7, followers: followers, image: "astana"),
        Trip(season: .summer, location: "London", year: 2021, duration: 10, followers: followers, image: "london")
    ]
    
    lazy var tripsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TripCardCell.self, forCellReuseIdentifier: TripCardCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let topMenuBar: TopMenuBarStackView = {
        let menuBar = TopMenuBarStackView()
        return menuBar
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(topMenuBar)
        view.addSubview(tripsTableView)
        
        setTopMenuBarConstraints()
        configButtons()
        setTableViewConstraints()
    }
    
    private func configButtons() {
        topMenuBar.summerButton.addTarget(self, action: #selector(didTapSummerButton), for: .touchUpInside)
        topMenuBar.springButton.addTarget(self, action: #selector(didTapSpringButton), for: .touchUpInside)
        topMenuBar.fallButton.addTarget(self, action: #selector(didTapFallButton), for: .touchUpInside)
        topMenuBar.winterButton.addTarget(self, action: #selector(didTapWinterButton), for: .touchUpInside)
    }
    
    /// Button functions
    
    @objc private func didTapSummerButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.summerButton.isSelected.toggle()
    }
    
    @objc private func didTapSpringButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.springButton.isSelected.toggle()
    }
    
    @objc private func didTapFallButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.fallButton.isSelected.toggle()
    }
    
    @objc private func didTapWinterButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }

        topMenuBar.winterButton.isSelected.toggle()
    }
    
    /// Constraints
    private func setTopMenuBarConstraints() {
        NSLayoutConstraint.activate([
            topMenuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setTableViewConstraints() {
        let padding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            tripsTableView.topAnchor.constraint(equalTo: topMenuBar.bottomAnchor, constant: -4),
            tripsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            tripsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            tripsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

/// Table View Delegate Methods

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
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
        let trip = trips[indexPath.section]
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
