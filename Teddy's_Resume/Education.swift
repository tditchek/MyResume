//
//  Education.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/3/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

struct Education {
    
    // TODO: eventually allow multiple colleges and extend to other types of learning institutions
    var college: String
    // TODO: eventually allow multiple degrees
    var degree: String
    var graduationDate: String
    var majors: [Major]
    var awards: [Award]
    
}

struct Major {
    var name: String
}

struct Award {
    var title: String
    // TODO: make sure year has bounds check
    var year: Int
}

enum DegreeType {
    case BA
    case BS
    case PhD
    case MA
    case MBA
}

struct College {
    var name: String
    var startedDate: String
    var graduationDate: String
}

//
//class Education: NSObject {
//    
//    var college : String!
//    var gpa : String!
//    var major : [String]!
//    var graduationDate : String!
//    var awards : [String]!
//    
//   
//}
