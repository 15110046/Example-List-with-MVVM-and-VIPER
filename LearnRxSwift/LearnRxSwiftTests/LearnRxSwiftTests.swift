//
//  LearnRxSwiftTests.swift
//  LearnRxSwiftTests
//
//  Created by Nguyen Hieu on 8/13/19.
//  Copyright © 2019 com.nguyenhieu.BaseProject. All rights reserved.
//

import XCTest
@testable import LearnRxSwift

class LearnRxSwiftTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    func testCarViewModelWithFerrariF12() {
//        let ferrariF12 = Car(model: "F12", make: "Ferrari", horsepower: 730, photoURL: "http://auto.ferrari.com/en_EN/media/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
//        let ferrariViewModel = CarViewModel(car: ferrariF12)
//        XCTAssertEqual(ferrariViewModel.modelText, "F12")
//        XCTAssertEqual(ferrariViewModel.makeText, "Ferrari")
//        XCTAssertEqual(ferrariViewModel.horsepowerText, "730 HP")
//        XCTAssertEqual(ferrariViewModel.photoURL, NSURL(string: ferrariF12.photoURL!))
//        XCTAssertEqual(ferrariViewModel.titleText, "Ferrari F12")
//    }
}
