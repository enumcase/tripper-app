//
//  TripsViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripsViewController: UIViewController {

    let tripsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let topMenuBar: TopMenuBarStackView = {
        let menuBar = TopMenuBarStackView()
        return menuBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tripsTableView.delegate = self
        tripsTableView.dataSource = self
        
        view.addSubview(topMenuBar)
        
        setTopMenuBarConstraints()
        configButtons()
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
        
        topMenuBar.summerButton.isSelected = true
    }
    
    @objc private func didTapSpringButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.springButton.isSelected = true
    }
    
    @objc private func didTapFallButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.fallButton.isSelected = true
    }
    
    @objc private func didTapWinterButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        topMenuBar.winterButton.isSelected = true
    }
    
    /// Constraints
    private func setTopMenuBarConstraints() {
        NSLayoutConstraint.activate([
            topMenuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }

}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
