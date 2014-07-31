//
//  Tags.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/30/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class Tag: NSObject {
    
    var name: String?
    var count: Int?
    
    init(itemDict: NSDictionary) {
        self.name = itemDict.objectForKey("name") as? String
        self.count = itemDict.objectForKey("count") as? Int
    }
   
}
