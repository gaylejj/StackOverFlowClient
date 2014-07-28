//
//  UserTest.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit
import XCTest

class UserTest: XCTestCase {
    
    let testUser = User()

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
    
    func testOwner() {
        testUser.owner = ["One": 1, "Two": 2]
        XCTAssertNotNil(testUser.owner, "Owner info could not be found")
    }
    
    func testBadgeCounts() {
        testUser.badgeCounts = ["One": 1, "Two": 2]
        XCTAssertNotNil(testUser.badgeCounts, "Badge counts could not be loaded")
    }
    
    func testIsEmployee() {
        testUser.isEmployee = false
        XCTAssertNotNil(testUser.isEmployee, "Employee status could not be found")
    }
    
    func testUserCreationgDate() {
        testUser.userCreationDate = NSDate()
        XCTAssertNotNil(testUser.userCreationDate, "Creation date could not be found")
    }
    
    func testLocation() {
        testUser.location = "Seattle"
        XCTAssertNotNil(testUser.location, "Location could not be found")
    }
    
    func testUserLink() {
        testUser.userLink = NSURL(string: "www.espn.com")
        XCTAssertNotNil(testUser.userLink, "Link could not be found")
    }
    
    func testDisplayName() {
        testUser.displayName = "Jeff"
        XCTAssertNotNil(testUser.displayName, "Display name could not be found")
    }


}
