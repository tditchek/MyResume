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
    
    @IBOutlet weak var responsibilityLeadingConstraint: NSLayoutConstraint!
    
    var isMainResponsibility: Bool = false
    
    var responsibility: Responsibility? {
        didSet {
            configureCell()
        }
    }
    
    private func configureCell() {
        responsibilityLabel.text = responsibility!.text
        
        if responsibility!.isMain {
            responsibilityLabel.font = UIFont(name: "Calibri-Bold", size: 18.0)
            responsibilityLeadingConstraint.constant = 8
            
        } else {
            responsibilityLabel.font = UIFont(name: "Calibri", size: 18.0)
            responsibilityLeadingConstraint.constant = 28
        }
        setNeedsUpdateConstraints()
    }
    
//    // MARK: - Properties
//    var cityWeather: CityWeather? {
//        didSet {
//            configureCell()
//        }
//    }
//    
//    // MARK: - Utility methods
//    private func configureCell() {
//        cityImageView.image = cityWeather?.cityImage
//        cityNameLabel.text = cityWeather?.name
//    }

    

    
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
