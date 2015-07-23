//
//  ExperienceSectionHeaderView.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/23/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class ExperienceSectionHeaderView: UIView {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    func load(job: Job) {
        
        companyLabel.text = job.company
        periodLabel.text = job.period
        positionLabel.text = job.position
     
    }
/*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}