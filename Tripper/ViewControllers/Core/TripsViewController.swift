//
//  TripsViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripsViewController: UIViewController {

    let topMenuBar: TopMenuBarStackView = {
        let menuBar = TopMenuBarStackView()
        return menuBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(topMenuBar)
        
        setTopMenuBarConstraints()
        configButtons()
    }
    
    private func setTopMenuBarConstraints() {
        NSLayoutConstraint.activate([
            topMenuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func configButtons() {
        topMenuBar.summerButton.addTarget(self, action: #selector(didTapSummerButton), for: .touchUpInside)
        topMenuBar.springButton.addTarget(self, action: #selector(didTapSpringButton), for: .touchUpInside)
        topMenuBar.fallButton.addTarget(self, action: #selector(didTapFallButton), for: .touchUpInside)
        topMenuBar.winterButton.addTarget(self, action: #selector(didTapWinterButton), for: .touchUpInside)
    }
    
    @objc private func didTapSummerButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
        }
        
        topMenuBar.summerButton.isSelected = true
    }
    
    @objc private func didTapSpringButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
        }
        
        topMenuBar.springButton.isSelected = true
    }
    
    @objc private func didTapFallButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
        }
        
        topMenuBar.fallButton.isSelected = true
    }
    
    @objc private func didTapWinterButton() {
        for button in topMenuBar.arrangedSubviews as! [UIButton] {
            button.isSelected = false
        }
        
        topMenuBar.winterButton.isSelected = true
    }

}
