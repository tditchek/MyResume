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
}


