//
//  User.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var owner : Dictionary<String, AnyObject>?
    var badgeCounts : Dictionary<String, Int>?
    var isEmployee : Bool?
    var userCreationDate : NSDate?
    var location : String?
    var userLink : NSURL?
    var displayName : String?
   
}
