//
//  LightyLoggerTests.swift
//  LightyLoggerTests
//
//  Created by Abdullah Selek on 23/12/2016.
//
//

import XCTest

@testable import Lighty

class LightyLoggerTests: XCTestCase {

    var logger: LightyLogger!
    
    override func setUp() {
        super.setUp()
        logger = LightyLogger.sharedInstance
    }

    func testInit() {
        let logger = LightyLogger.sharedInstance
        XCTAssertNotNil(logger.dateFormatter)
        XCTAssertEqual(logger.separator, " | ")
    }

    func testCreateDateFormatter() {
        let dateFormatter = logger.createDateFormatter()
        XCTAssertNotNil(dateFormatter)
        XCTAssertEqual(dateFormatter.dateStyle, DateFormatter.Style.short)
        XCTAssertEqual(dateFormatter.timeStyle, DateFormatter.Style.medium)
    }

    func testGetAccessoryWithType() {
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .verbose), "💜")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .debug), "💙")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .info), "💚")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .warn), "💛")
        XCTAssertEqual(logger.getAccessoryWithType(messageType: .error), "❤️")
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
