//
//  AnswerTest.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit
import XCTest

class AnswerTest: XCTestCase {
    
    let testAnswer = Answer()

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
    
    func testIsAnswered() {
        testAnswer.isAnswered = false
        XCTAssertNotNil(testAnswer.isAnswered, "Answer's state can not be defined")
    }

    func testAnswerCount() {
        testAnswer.answerCount = 10
        XCTAssertNotNil(testAnswer.answerCount, "Answer's answer count can not be identified")
    }
    
    func testScore() {
        testAnswer.score = 10
        XCTAssertNotNil(testAnswer.score, "Answer's score can't be identified")
    }
    
    func testCreationDate() {
        testAnswer.creationDate = NSDate()
        XCTAssertNotNil(testAnswer.creationDate, "Creation date could not be found")
    }

    func testActivityDate() {
        testAnswer.answerLastActivityDate = NSDate()
        XCTAssertNotNil(testAnswer.answerLastActivityDate, "Activity Date could not be found")
    }

}
