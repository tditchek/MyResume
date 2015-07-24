//
//  AppDelegate.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/1/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //println(UIFont.familyNames())
//        for name in UIFont.familyNames() {
//            println(name)
//            if let nameString = name as? String
//            {
//                println(UIFont.fontNamesForFamilyName(nameString))
//            }
//        }
        
        return true
    }
    
    // MARK: -
    // MARK: PROPERTY LISTS
    // MARK: Load Experience
    func loadExperience() -> Experience {
        
        var myExp = Experience(jobs: [])
        
        let filepath = NSBundle.mainBundle().pathForResource("Experience", ofType: "plist")
        let dict  = NSDictionary(contentsOfFile: filepath!)
        let exp = Array(dict!.valueForKey("experience") as! NSArray)
        
        for job in exp {
            
            let company = String(job.valueForKey("company") as! NSString)
            let period = String(job.valueForKey("period") as! NSString)
            let position = String(job.valueForKey("position") as! NSString)
            let responsibilities = Array(job.valueForKey("responsibilities") as! NSArray)
            
            var myResponsibilities: [Responsibility] = []
            
            for entry in responsibilities {
                let text = String(entry.valueForKey("text") as! NSString)
                let isMain = Bool(entry.valueForKey("isMain") as! NSNumber)
                
                let responsibility = Responsibility(text: text, isMain: isMain)
                myResponsibilities.append(responsibility)
                //                println("\(myResponsibilities)")
            }
            
            //for resp in
            
            let myJob = Job(company: company, period: period, position: position, responsibilities: myResponsibilities)
            myExp.jobs.append(myJob)
        }
        
        //println("\(exp)")
        
        //    println()
        //    println("ALL EXPERIENCE:")
        //    println("\(myExp)")
        return myExp
    }
    
    // MARK: Load Skills from Plist
    func loadTechSkills() -> TechSkills {
        
        var myTechSkills = TechSkills(skillCategories: [])
        
        let filepath = NSBundle.mainBundle().pathForResource("Skills", ofType: "plist")
        let dict  = NSDictionary(contentsOfFile: filepath!)
        let categories = Array(dict!.valueForKey("skillCategories") as! NSArray)
        
        for category in categories {
            
            //let company = String(job.valueForKey("company") as! NSString)
            //let period = String(job.valueForKey("period") as! NSString)
            let categoryString = String(category.valueForKey("category") as! NSString)
            let skills = Array(category.valueForKey("skills") as! NSArray)
            
            var mySkills: [Skill] = []
            
            for skill in skills {
             
                let name = String(skill.valueForKey("name") as! NSString)
                let icon = String(skill.valueForKey("icon") as! String)
                
                let mySkill = Skill(name: name, icon: UIImage(named: icon)!)
                mySkills.append(mySkill)
            }
            
            //let skill = Skill(name: ;, icon: <#UIImage#>)
            let category = SkillCategory(category: categoryString, skills: mySkills)
            myTechSkills.skillCategories.append(category)
            
            }
        
            return myTechSkills
        }
// TODO: add Plist for Education/AboutMe and implement load methods
//    // MARK: Load Education from Plist
//    func loadEducation() -> Education {
//        
//        
//        return Education()
//    }
//    
//    // MARK: Load About Me from Plist
//    func loadAboutMe() -> Teddy {
//        
//        return Teddy()
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

