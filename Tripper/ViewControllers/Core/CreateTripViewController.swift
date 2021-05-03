//
//  CreateTripViewController.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class CreateTripViewController: UIViewController {
    
    private var createdTrip: Trip!
    
    private let placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.main
        return imageView
    }()
    
    private let darkenedView = DarkenedView()
    
    private let imageAddButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ButtonImages.camera, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let createTripButton = TripperMainButton(title: "Create Trip")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(placeholderImageView)
        view.addSubview(darkenedView)
        view.addSubview(imageAddButton)
        view.addSubview(createTripButton)
        setConstraints()
        
        imageAddButton.addTarget(self, action: #selector(imageAddButtonTapped), for: .touchUpInside)
        createTripButton.addTarget(self, action: #selector(didTapCreateTripButton), for: .touchUpInside)
    }
    
    @objc private func imageAddButtonTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @objc private func didTapCreateTripButton() {
        print("Yay! Trip created")
    }

    private func setConstraints() {
        let leftRightPadding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            placeholderImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightPadding),
            placeholderImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightPadding),
            placeholderImageView.heightAnchor.constraint(equalToConstant: 197),
            
            darkenedView.topAnchor.constraint(equalTo: placeholderImageView.topAnchor),
            darkenedView.bottomAnchor.constraint(equalTo: placeholderImageView.bottomAnchor),
            darkenedView.leadingAnchor.constraint(equalTo: placeholderImageView.leadingAnchor),
            darkenedView.trailingAnchor.constraint(equalTo: placeholderImageView.trailingAnchor),
            
            imageAddButton.centerYAnchor.constraint(equalTo: placeholderImageView.centerYAnchor),
            imageAddButton.centerXAnchor.constraint(equalTo: placeholderImageView.centerXAnchor),
            imageAddButton.widthAnchor.constraint(equalToConstant: 64),
            imageAddButton.heightAnchor.constraint(equalTo: imageAddButton.widthAnchor),
            
            createTripButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            createTripButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createTripButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
}

extension CreateTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.editedImage] as? UIImage else { return }
        self.placeholderImageView.image = pickedImage
        picker.dismiss(animated: true)
    }
    
}
