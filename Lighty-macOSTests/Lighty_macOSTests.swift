//
//  Lighty_macOSTests.swift
//  Lighty-macOSTests
//
//  Created by Abdullah Selek on 23/12/2016.
// 
//

import XCTest
@testable import Lighty

class Lighty_macOSTests: XCTestCase {

    var logger: LightyLogger!

    override func setUp() {
        super.setUp()
        logger = LightyLogger.sharedInstance
    }
    
    func testGetAccessoryWithType() {
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .verbose), "💜")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .debug), "💙")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .info), "💚")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .warn), "💛")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .error), "❤️")
    }

    func testTrackMessage() {
        let path = logger.track(message: "test")
        XCTAssertNotNil(path)
    }

    func testLog() {
        let mocklogger = MockLightyLogger()
        mocklogger.log(type: .error, message: "test")
        XCTAssertTrue(mocklogger.logged)
    }

    override func tearDown() {
        logger = nil
        super.tearDown()
    }
    
}

class MockLightyLogger: LightyLogger {

    var logged = false

    override public func log(type: LightyMessageType,
                             message: String,
                             file: String = #file,
                             function: String = #function,
                             line: Int = #line) {
        super.log(type: type, message: message)
        logged = true
    }
    
}
