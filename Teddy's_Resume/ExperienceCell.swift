//
//  ExperienceCell.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/22/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class ExperienceCell: UITableViewCell {

    @IBOutlet weak var responsibilityLabel: UILabel!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var responsibility: Responsibility? {
        didSet {
            configureCell()
        }
    }
    
    var lastInSection: Bool = false
    
    private func configureCell() {
        responsibilityLabel.text = responsibility!.text
        
        if responsibility!.isMain {
            responsibilityLabel.font = UIFont(name: "Calibri-Bold", size: 14.0)
            leadingConstraint.constant = 12
            
        } else {
            responsibilityLabel.font = UIFont(name: "Calibri", size: 14.0)
            leadingConstraint.constant = 48
        }
        
        // bottomConstraint.constant = lastInSection ? 24 : 4
        
        setNeedsUpdateConstraints()
        
    }
}
