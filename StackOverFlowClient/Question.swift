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
    var questionID : Int?
    var owner : User!
    
    var questions = [Question]()

    class func questionsFromJSON(jsonData : NSArray) -> [Question]{
        
        var questions = [Question]()
    
        for jsonQuestion : AnyObject in jsonData {
            var question = Question(questionID: 0, questionAnswerCount: 0, questionScore: 0)
            question.questionViewCount = jsonQuestion.objectForKey("view_count") as? Int
            question.questionAnswerCount = jsonQuestion.objectForKey("answer_count") as? Int
            question.questionID = jsonQuestion.objectForKey("question_id") as? Int
            question.questionTitle = jsonQuestion.objectForKey("title") as? String
            question.questionScore = jsonQuestion.objectForKey("score") as? Int
            question.questionLink = jsonQuestion.objectForKey("link") as? NSURL
            question.questionLastActivityDate = jsonQuestion.objectForKey("last_activity_date") as? NSDate
            question.questionCreationDate = jsonQuestion.objectForKey("creation_date") as? NSDate
            
            if let user = jsonQuestion["owner"] as? NSDictionary {
                var user_id = user["user_id"] as String
                var displayName = user["display_name"] as String
                var link = user["link"] as NSURL
                var profileImage = user["profile_image"] as UIImage
                
            }
            
            questions += question
        }
        return questions
    }
    
    init(questionID: Int, questionAnswerCount: Int, questionScore: Int) {
        self.questionID = questionID
        self.questionAnswerCount = questionAnswerCount
        self.questionScore = questionScore
    }

    
        
//        for jsonQuestion : AnyObject in jsonData {
//            
//        }
    
//    func parseJsonData(data: NSData) {
//        
//        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        
//        var items = json["items"] as? Array<NSDictionary>
//        
//        println(items!.count)
//        
//        for item in items {
//            questionViewCount! = item["view_count"] as Int
//            
//        }
//        
//    }
    
    
}
