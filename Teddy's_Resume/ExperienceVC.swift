//
//  ExperienceVC.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/2/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class ExperienceVC: UIViewController {
    
    var experience: Experience!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        experience = appDelegate.loadExperience()
        tableView.estimatedRowHeight = 20.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 208.0
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
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

extension ExperienceVC: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return experience.jobs.count
        //return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experience.jobs[section].responsibilities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ExperienceCell", forIndexPath: indexPath) as! ExperienceCell
        
//        if indexPath.row == experience.jobs[indexPath.section].responsibilities.count {
//            cell.lastInSection = true
//        }
        
        let responsibility: Responsibility = experience.jobs[indexPath.section].responsibilities[indexPath.row]
        cell.responsibility = responsibility
        
        //println("Cell \(indexPath.row+1): height \(cell.frame.size.height)")
        
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
////        var cell: ExperienceCell = tableView.cellForRowAtIndexPath(indexPath) as! ExperienceCell
//        
//
//        return 44.0
//    }
    
}

extension ExperienceVC: UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let job = experience.jobs[section]
        
        let viewArray = NSBundle.mainBundle().loadNibNamed("ExperienceSectionHeaderView", owner: self, options: nil)
        let headerView = viewArray[0] as! UIView
        
        var companyLbl = headerView.viewWithTag(101) as! UILabel
        companyLbl.text = job.company
        companyLbl.numberOfLines = 0
        
        var periodLbl = headerView.viewWithTag(102) as! UILabel
        periodLbl.text = job.period
        periodLbl.numberOfLines = 0
        
        var positionLbl = headerView.viewWithTag(103) as! UILabel
        positionLbl.text = job.position
        positionLbl.numberOfLines = 0
        
        return headerView
        
//        
//        var headerView = ExperienceSectionHeaderView()
//        //headerView.awakeFromNib()
//        
//        let job: Job = experience.jobs[section]
//        headerView.job = job
//        //println("\(job.company)... \(job.position)")
//        
//        return headerView
    }
    
//    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 134.0
//    }
}