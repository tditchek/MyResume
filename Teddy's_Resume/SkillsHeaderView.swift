//
//  SkillsHeaderView.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/24/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class SkillsHeaderView: UICollectionReusableView {
   
    @IBOutlet weak var categoryLabel: UILabel!
    var category: SkillCategory! {
        didSet {
            configureHeader()
        }
    }
    
    func configureHeader() {
        categoryLabel.text = category!.name
        println("configureHeader(): set text to \(category!.name)")
    }
}


