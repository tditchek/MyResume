//
//  Experience.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/8/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

struct Experience {
    var jobs: [Job]
}

struct Job {
    var company: String
    var period: String
    var position: String
    var responsibilities: [Responsibility]
}

struct Responsibility {
    var text: String
    var isMain: Bool = false
    //var main: String
    //var subs: [String]
}


func loadExperience() -> Experience {
    
    var myExp = Experience(jobs: [])
    
    let filepath = NSBundle.mainBundle().pathForResource("Experience", ofType: "plist")
    let dict  = NSDictionary(contentsOfFile: filepath!)
    let exp = Array(dict!.valueForKey("experience") as! NSArray)
    
    //var myJobs: [Job] = []
    
//    println("JOBS:")
    for job in exp {
        
        let company = String(job.valueForKey("company") as! NSString)
        let period = String(job.valueForKey("period") as! NSString)
        let position = String(job.valueForKey("position") as! NSString)
        let responsibilities = Array(job.valueForKey("responsibilities") as! NSArray)
        
        var myResponsibilities: [Responsibility] = []
        
//        println("RESPONSIBILITIES:")
        for entry in responsibilities {
            let text = String(entry.valueForKey("text") as! NSString)
            let isMain = Bool(entry.valueForKey("isMain") as! NSNumber)
            
            let responsibility = Responsibility(text: text, isMain: isMain)
            myResponsibilities.append(responsibility)
//            println("\(myResponsibilities)")
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



/*

    Monimus LLC
    Sept '14 - Present
    Lead iOS Developer & Mobile Project Manager
            (MAIN) International Team Lead for Native iOS component of the ShowdMe P2P educational platform
            (SUB) Overseeing design and implementation of product development
            (SUB) Optimized UX/UI across multiple screen sizes and varying network connections
            (SUB) Increased security through application of best mobile practices

            (MAIN) Project Lead for native iOS and Android components of the Canvs+ visual project management tool
            (SUB) Adapting web designs to provide optimal native mobile experience across all devices
            (SUB) Creating state of the art real-time collaborative experience through IoT technologies including but not limited to: NFC, Multipeer Connectivity, Bluetooth LE, and iBeacon
            (SUB) Rapid prototyping of multiplatform MVP from concept phase

            (MAIN) Team Lead responsibilities including:
            (SUB) Managing Scrum and Kanban boards, weekly sprints, and holding daily stand up meetings
            (SUB) Contributed to product design via frequent collaboration with UX/UI design teams
            (SUB) Reviewed all code changes to mobile app repositories across several projects
            (SUB) Mentoring of junior developers in iOS development using both Swift and Objective-C

*/