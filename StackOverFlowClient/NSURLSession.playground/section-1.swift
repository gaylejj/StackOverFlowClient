// Playground - noun: a place where people can play

import UIKit

let url = NSURL(string: "http://api.stackexchange.com/docs/search#pagesize=5&order=desc&sort=activity&tagged=swift&filter=default&site=stackoverflow.json")

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
                case 404:
                    println("Not ok")
                default:
                    println("ooops")
                }
            }
        }
        
    })

dataTask.resume()

