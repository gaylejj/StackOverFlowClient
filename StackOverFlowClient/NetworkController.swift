//
//  NetworkController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/29/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class NetworkController: NSObject {

    let apiDomain = "http://api.stackexchange.com/2.2/"
    let apiMidPoint = "search?order=desc&sort=activity"
    let searchEndpoint = "&site=stackoverflow"
    
    func parseResponse(responseData: NSData) -> [Question] {
        var questions = [Question]()

        if let responseDict = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: nil) as? NSDictionary {
            
            if let items = responseDict["items"] as? NSArray {
                for item in items {
                    if let itemDict = item as? NSDictionary {
                        let question = Question(itemDict: itemDict)
                        questions += question
                        println("Question's title is \(question.questionTitle)")
                        println("Question's link is \(question.link)")
                        
                    }
                }
            }
        }
    return questions
    }
    
    func parseTags(tagsData: NSData) -> [Tag] {
        var tags = [Tag]()
        
        if let tagsDict = NSJSONSerialization.JSONObjectWithData(tagsData, options: nil, error: nil) as? NSDictionary {
            
            if let items = tagsDict["items"] as? NSArray {
                for item in items {
                    if let itemDict = item as? NSDictionary {
                        let tag = Tag(itemDict: itemDict)
                        tags += tag
                    }
                }
            }
            
        }
        return tags
    }
    
    func fetchQuestionsFromSampleData(callback : (questions : [Question]?, errorDescription : String?) -> Void) {
        let sampleData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("Example", ofType: "json"))
        var questions = self.parseResponse(sampleData)
        callback(questions: questions, errorDescription: nil)
    }
    
    func downloadListOfTags(callback: (tags: [Tag]?, errorDescription: String?) -> Void) {
        let url = NSURL(string: "http://api.stackexchange.com/2.2/tags?order=desc&sort=popular&site=stackoverflow")
        
        let request = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if error {
                println("General Error")
            } else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        println("Everything is ok")
                        callback(tags: self.parseTags(data), errorDescription: nil)
                    case 404:
                        println("Not ok")
                        callback(tags: nil, errorDescription: "404 Not found")
                    case 400:
                        println("Bad request")
                    default:
                        println("ooops")
                    }
                }
            }
            
        })
        dataTask.resume()
    }
    
    func downloadSearchResults(searchTerm: String, callback : (questions : [Question]?, errorDescription : String?) -> Void) {
        let url = NSURL(string: apiDomain + apiMidPoint + "&tagged=\(searchTerm)" + searchEndpoint)
        
        let request = NSURLRequest(URL: url)

        
        let session = NSURLSession.sharedSession()

    
        let dataTask = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                
                if error {
                    println("General error")
                } else {
                    if let httpResponse = response as? NSHTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200:
                            println("Everything is ok")
                            callback(questions: self.parseResponse(data), errorDescription: nil)
                        case 404:
                            println("Not ok")
                            callback(questions: nil, errorDescription: "404 Not found")
                        case 400:
                            println("Bad request")
                        default:
                            println("ooops")
                        }
                    }
                }
            })
        dataTask.resume()
    }


}
