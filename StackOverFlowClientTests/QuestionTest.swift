//
//  QuestionTest.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit
import XCTest

class QuestionTest: XCTestCase {
    
    let testQuestion = Question(questionID: 0, questionAnswerCount: 0, questionScore: 0)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testQuestionViewCount() {
        let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("Example", ofType: "json"))
        
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        
        if let questionsArray = jsonData["items"] as? NSArray {
            var questions: [Question] = Question.questionsFromJSON(questionsArray)
            println(questions)
            XCTAssertNotNil(questions, "Question Answer Count could not be found")
            
        }

        
        testQuestion.questionViewCount = 10
        XCTAssertNotNil(testQuestion.questionViewCount, "Question View Count could not be found")
    }
    
    func testQuestionAnswerCount() {
        
        let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("Example", ofType: "json"))
        
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        
        if let questionsArray = jsonData["items"] as? NSArray {
           var questions: [Question] = Question.questionsFromJSON(questionsArray)
            println(questions)
            XCTAssertNotNil(questions, "Question Answer Count could not be found")

        }
        
    }
    
    func testQuestionScore() {
        testQuestion.questionScore = 9
        XCTAssertNotNil(testQuestion.questionScore, "Score could not be found")
    }
    
    func testQuestionLastActivityDate() {
        testQuestion.questionLastActivityDate = NSDate()
        XCTAssertNotNil(testQuestion.questionLastActivityDate, "Date could not be found")
    }
    
    func testQuestionCreationDate() {
        testQuestion.questionCreationDate = NSDate()
        XCTAssertNotNil(testQuestion.questionCreationDate, "Date could not be loaded")
    }
    
    func testQuestionLink() {
        testQuestion.questionLink = NSURL(string: "www.espn.com")
        XCTAssertNotNil(testQuestion.questionLink, "Link could not be found")
    }
    
    func testQuestionTitle() {
        testQuestion.questionTitle = "Title"
        XCTAssertNotNil(testQuestion.questionTitle, "Title could not be found")
    }

}
