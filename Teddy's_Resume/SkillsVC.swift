//
//  SkillsVC.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/2/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class SkillsVC: UIViewController {
    
    private let cellReuseIdentifier = "SkillCell"
    private let headerReuseIdentifier = "SkillHeader"

    var techStack: TechStack!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        techStack = appDelegate.loadTechStack()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SkillsVC: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return techStack.skillCategories.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return techStack.skillCategories[section].skills.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! SkillCell
        
        let skill: Skill = techStack.skillCategories[indexPath.section].skills[indexPath.item]
        cell.skill = skill
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerReuseIdentifier, forIndexPath: indexPath) as! SkillsHeaderView
            
            let category: SkillCategory = techStack.skillCategories[indexPath.section]
            
            return headerView

        default:
            // TODO: switch the assert(false) out for something else
            assert(false, "Unexpected element kind")
        }
    }
    
}

extension SkillsVC: UICollectionViewDelegate {
    
    
    
}


