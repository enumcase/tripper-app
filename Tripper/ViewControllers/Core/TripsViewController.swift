//
//  TripsViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripsViewController: DataLoadingViewController {
    
    private var trips: [Trip] = []
    private var summerTrips: [Trip] = []
    private var springTrips: [Trip] = []
    private var fallTrips: [Trip] = []
    private var winterTrips: [Trip] = []
    
    private lazy var tripsTableView: UITableView = {
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
        view.addSubview(tripsTableView)
        
        setTopMenuBarConstraints()
        configButtons()
        setTableViewConstraints()
        
        getTripsData()
    }
    
    private func getTripsData() {
        showLoadingView()
        NetworkManager.shared.getTrips { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let trips):
                self.trips = trips
                DispatchQueue.main.async {
                    self.tripsTableView.reloadData()
                }
            case .failure(let error):
                self.PresentAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
            
            self.dismissLoadingView()
        }
    }
    
    private func getSeasonTrips() {
        summerTrips = trips.filter({ (trip) -> Bool in
            trip.season == "Summer"
        })
        
        springTrips = trips.filter({ (trip) -> Bool in
            trip.season == "Spring"
        })
        
        fallTrips = trips.filter({ (trip) -> Bool in
            trip.season == "Summer"
        })
        
        winterTrips = trips.filter({ (trip) -> Bool in
            trip.season == "Summer"
        })
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
//        if cell.isBookmarked
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
}
