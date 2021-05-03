//
//  TripCardCell.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripCardCell: UITableViewCell {

    var isBookmarked = false
    
    weak var delegate: TripsViewController!
    
    // UI Elements of cell
    
    private let darkenedView = DarkenedView()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(ButtonImages.notBookmarked, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let seasonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cardLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private let yearDurationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    static var reuseIdentifier: String {
        return String(describing: TripCardCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        layer.cornerRadius = 18
        
        addSubview(cardImageView)
        addSubview(darkenedView)
        contentView.addSubview(bookmarkButton)
        addSubview(seasonImageView)
        addSubview(cardLocationLabel)
        addSubview(yearDurationLabel)
        
        setConstraints()
        
        bookmarkButton.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
    }
    
    @objc func didTapBookmarkButton() {
        isBookmarked.toggle()
        bookmarkButton.setBackgroundImage(
            self.isBookmarked ? ButtonImages.bookmarked : ButtonImages.notBookmarked,
            for: .normal
        )
        
        delegate.handleBookmarkAction(for: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCardData(for trip: Trip) {
        setSeasonImageView(of: trip)
        cardLocationLabel.text = trip.name
        if let duration = trip.duration {
            yearDurationLabel.text = "\(trip.season) \(trip.year) - \(duration) days"
        } else {
            yearDurationLabel.text = "\(trip.season) \(trip.year)"
        }
        
        #warning("Uncomment when DB is redone")
//        NetworkManager.shared.downloadImage(from: trip.image) { [weak self] image in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                self.cardImageView.image = image
//            }
//        }
        
        cardImageView.image = UIImage(named: trip.image)
        
        bookmarkButton.setBackgroundImage(
            self.isBookmarked ? ButtonImages.bookmarked : ButtonImages.notBookmarked,
            for: .normal
        )

    }

    private func setSeasonImageView(of trip: Trip) {
        switch trip.season {
        case "Summer":
            self.seasonImageView.image = SeasonImages.summer
        case "Spring":
            self.seasonImageView.image = SeasonImages.spring
        case "Fall":
            self.seasonImageView.image = SeasonImages.fall
        case "Winter":
            self.seasonImageView.image = SeasonImages.winter
        default:
            break
        }
    }
    
//    @objc private func didTapBookmarkButton() {
//        isBookmarked.toggle()
//        print(isBookmarked)
//        bookmarkButton.setBackgroundImage(
//            self.isBookmarked ? ButtonImages.bookmarked : ButtonImages.notBookmarked,
//            for: .normal
//        )
//    }
    
    private func setConstraints() {
        
        let leftRightPadding: CGFloat = 24
        let bottomPadding: CGFloat = 12
        let spacing: CGFloat = 7
        
        NSLayoutConstraint.activate([
            darkenedView.topAnchor.constraint(equalTo: self.topAnchor),
            darkenedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            darkenedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            darkenedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cardImageView.topAnchor.constraint(equalTo: self.topAnchor),
            cardImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            bookmarkButton.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: -3),
            bookmarkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leftRightPadding),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 24),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
            
            yearDurationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomPadding),
            yearDurationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leftRightPadding),
            
            cardLocationLabel.bottomAnchor.constraint(equalTo: yearDurationLabel.topAnchor, constant: -spacing),
            cardLocationLabel.leadingAnchor.constraint(equalTo: yearDurationLabel.leadingAnchor),
            
            seasonImageView.bottomAnchor.constraint(equalTo: cardLocationLabel.topAnchor, constant: -spacing),
            seasonImageView.leadingAnchor.constraint(equalTo: cardLocationLabel.leadingAnchor)
        ])
    }
    
}
