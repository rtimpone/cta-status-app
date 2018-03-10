//
//  TodayTableViewCell.swift
//  CTAStatusTodayExtension
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CTAStatusFramework
import UIKit

class TodayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func updateLabels(for route: Route) {
    
        nameLabel.text = route.name
        
        if let textColor = UIColor(hex: route.routeBackgroundColorHexValue) {
            nameLabel.textColor = textColor
        }
        
        statusLabel.text = route.status
    }
}
