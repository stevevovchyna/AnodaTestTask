//
//  AnodaTestTests.swift
//  AnodaTestTests
//
//  Created by Steven Vovchyna on 13.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import XCTest
@testable import AnodaTest

class AnodaTestTests: XCTestCase {
    
    let dataManager = AnodaTest.GeneralDataManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGeneralDataManager() throws {
        let testData = dataManager.getPostData(from: "generalData")
        let falseTestData = dataManager.getPostData(from: "wrongName")
        let wrongFormat = dataManager.getPostData(from: "test")
        XCTAssert(testData != nil)
        XCTAssert(falseTestData == nil)
        XCTAssert(wrongFormat == nil)
    }

    func testInitWithCoder() {
        let tableViewCell = AnodaTest.TableViewPostCell(coder: NSCoder())
        let collectionViewCell = AnodaTest.PostImageCell(coder: NSCoder())
        XCTAssertNil(tableViewCell)
        XCTAssertNil(collectionViewCell)
    }
}
