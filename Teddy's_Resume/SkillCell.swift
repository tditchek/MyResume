//
//  SkillCell.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/24/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class SkillCell: UICollectionViewCell {
 
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var skillLabel: UILabel!
    
    var skill: Skill? {
        didSet {
            configureCell()
        }
    }
        
    private func configureCell() {

        skillLabel.text = skill!.name
        iconView.image = skill!.icon
        
    }
    
        //        responsibilityLabel.text = responsibility!.text
//        
//        if responsibility!.isMain {
//            responsibilityLabel.font = UIFont(name: "Calibri-Bold", size: 14.0)
//            leadingConstraint.constant = 12
//            
//        } else {
//            responsibilityLabel.font = UIFont(name: "Calibri", size: 14.0)
//            leadingConstraint.constant = 48
//        }
//        
//        // bottomConstraint.constant = lastInSection ? 24 : 4
//        
//        setNeedsUpdateConstraints()
//        
//    }
    
}
