//
//  LightyLoggerTests.swift
//  Lighty
//
//  Created by Abdullah Selek on 18/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import Quick
import Nimble

@testable import Lighty

class LightyLoggerTests: QuickSpec {

    override func spec() {
        var logger: LightyLogger!
        beforeSuite {
            logger = LightyLogger.sharedInstance
        }
        describe("LigtyLogger Tests", {
            context("getColorWithType", {
                it("should return correct color", closure: {
                    expect(logger.getAccessoryWithType(messageType: .verbose)).to(equal("💜"))
                    expect(logger.getAccessoryWithType(messageType: .debug)).to(equal("💙"))
                    expect(logger.getAccessoryWithType(messageType: .info)).to(equal("💚"))
                    expect(logger.getAccessoryWithType(messageType: .warn)).to(equal("💛"))
                    expect(logger.getAccessoryWithType(messageType: .error)).to(equal("❤️"))
                })
            })
            context("track", {
                it("should return file, function and line number", closure: {
                    let path = logger.track(message: "test")
                    expect(path).notTo(beNil())
                })
            })
            context("log", {
                it("should print message", closure: {
                    let mocklogger = MockLightyLogger()
                    mocklogger.log(type: .error, message: "test")
                    expect(mocklogger.logged).to(beTrue())
                })
            })
        })
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
