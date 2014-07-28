//
//  Question.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    var questionViewCount : Int?
    var questionAnswerCount : Int?
    var questionScore : Int?
    var questionLastActivityDate : NSDate?
    var questionCreationDate : NSDate?
    var questionLink : NSURL?
    var questionTitle : String?
    
    var questions = [Question]()
    
//    init(data: NSData) {
//        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        
//        var items = json["items"] as? Array<NSDictionary>
//        
//        for item in items! {
//            self.questionViewCount = json["view_count"]
//            
//        }
//        
//    }
}
