//
//  NetworkController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/29/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class NetworkController: NSObject {

    
    func downloadSearchResults() {
        let url = NSURL(string: "http://api.stackexchange.com/2.2/search?pagesize=5&order=desc&sort=activity&tagged=swift&site=stackoverflow")
        
        let request = NSURLRequest(URL: url)
        
//        var request = NSMutableURLRequest(URL: NSURL(string: "http://api.stackexchange.com/docs/search#pagesize=5&order=desc&sort=activity&tagged=swift&filter=default&site=stackoverflow"))
        
//        request.HTTPMethod = "GET"
        //        var url = NSURL(string: "http://api.stackexchange.com/docs/search")
        
        //        let request = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
//        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
        let dataTask = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                
                if error {
                    println("General error")
                } else {
                    if let httpResponse = response as? NSHTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200:
                            println("Everything is ok")
                            var error : NSError?
                            let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
                            var jsonQuestions = jsonData["items"] as NSArray
                            var questions = Question.questionsFromJSON(jsonQuestions)
                        case 404:
                            println("Not ok")
                        default:
                            println("ooops")
                        }
                    }
                }
            })
        dataTask.resume()
    }


}
