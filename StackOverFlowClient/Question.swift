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
    var questionTitle : String?
    var questionID : Int?
    var tags : [String]?
    
//    var questions = [Question]()
    
    init(itemDict: NSDictionary) {
        self.questionTitle = itemDict.objectForKey("title") as? String
        self.questionID = itemDict.objectForKey("quesiton_id") as? Int
        self.questionViewCount = itemDict.objectForKey("view_count") as? Int
        self.questionAnswerCount = itemDict.objectForKey("answer_count") as? Int
        if let creationDateEpoch = itemDict.objectForKey("creation_date") as? Double {
            self.questionCreationDate = NSDate(timeIntervalSince1970: creationDateEpoch)
        }
        if let lastActivityDateEpoch = itemDict.objectForKey("last_activity_date") as? Double {
            self.questionLastActivityDate = NSDate(timeIntervalSince1970: lastActivityDateEpoch)
        }
        self.tags = itemDict.objectForKey("tags") as? [String]
    }

//    class func questionsFromJSON(jsonData : NSArray) -> [Question]{
//        
//        var questions = [Question]()
//    
//        for jsonQuestion : AnyObject in jsonData {
//            var question = Question()
//            question.questionViewCount = jsonQuestion.objectForKey("view_count") as? Int
//            question.questionAnswerCount = jsonQuestion.objectForKey("answer_count") as? Int
//            question.questionID = jsonQuestion.objectForKey("question_id") as? Int
//            question.questionTitle = jsonQuestion.objectForKey("title") as? String
//            question.questionScore = jsonQuestion.objectForKey("score") as? Int
//            question.questionLink = jsonQuestion.objectForKey("link") as? NSURL
//            question.questionLastActivityDate = jsonQuestion.objectForKey("last_activity_date") as? NSDate
//            question.questionCreationDate = jsonQuestion.objectForKey("creation_date") as? NSDate
//            
//            if let user = jsonQuestion["owner"] as? NSDictionary {
//                var user_id = user["user_id"] as String
//                var displayName = user["display_name"] as String
//                var link = user["link"] as NSURL
//                var profileImage = user["profile_image"] as UIImage
//                
//            }
//            
//            questions += question
//        }
//        return questions
//    }
    

    
}
