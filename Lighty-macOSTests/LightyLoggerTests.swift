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

    func testLog() {
        let mocklogger = MockLightyLogger()
        mocklogger.log(type: .error, message: "test")
        XCTAssertTrue(mocklogger.logged)
    }

    func testDLog() {
        let mockLogger = MockLightyLogger()
        mockLogger.dlog(type: .debug, message: "debug message")
        XCTAssertTrue(mockLogger.logged)
    }

    func testGetFormattedDate_whenDateDisabled() {
        let logger = LightyLogger.sharedInstance
        logger.enableDate = false
        XCTAssertEqual(logger.getFormattedDate(), "")
    }

    func testLog_whenLoggingDisabled() {
        let mockLogger = MockLightyLogger()
        mockLogger.enable = false
        mockLogger.log(type: .error, message: "test")
        XCTAssertFalse(mockLogger.logged)
    }

    func testDLog_whenLoggingDisabled() {
        let mockLogger = MockLightyLogger()
        mockLogger.enable = false
        mockLogger.dlog(type: .error, message: "test")
        XCTAssertFalse(mockLogger.logged)
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
        logged = super.enable
    }

    override public func dlog(type: LightyMessageType,
                              message: String,
                              file: String = #file,
                              function: String = #function,
                              line: Int = #line) {
        super.dlog(type: type, message: message)
        logged = super.enable
    }
    
}
