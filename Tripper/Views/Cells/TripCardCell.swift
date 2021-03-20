//
//  TripCardCell.swift
//  Tripper
//
//  Created by Margulan Daribayev on 20.03.2021.
//

import UIKit

class TripCardCell: UITableViewCell {

    var isFavorited = false
    var trip: Trip!
    
    static var reuseIdentifier: String {
        return String(describing: TripCardCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCardData(for trip: Trip) {
        
    }

}
