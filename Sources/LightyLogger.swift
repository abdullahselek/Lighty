//
//  LightyLogger.swift
//  Lighty
//
//  Created by Abdullah Selek on 17/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2016 Abdullah Selek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
#if os(Linux)
    import Glibc
#endif

/**
  Message type for logging
 */
public enum LightyMessageType: String {
    case verbose = "💜 VERBOSE"
    case debug = "💙 DEBUG"
    case info = "💚 INFO"
    case warn = "💛 WARN"
    case error = "❤️ ERROR"
}

/**
  Main class for log mechanism
 */
public class LightyLogger {

    /**
      Singleton instance of LightyLogger
     */
    public static let sharedInstance: LightyLogger = LightyLogger()

    /**
      DateFormatter used in logs to format log date and time
     */
    public var dateFormatter: DateFormatter!

    /**
      String used to separate log message
     */
    public var separator = " | "

    internal init() {
        dateFormatter = createDateFormatter()
    }

    internal func createDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }

    /**
      Main function print logs
      - parameter type: LightyMessageType
      - parameter message: Message string to log
      - parameter file: String internal parameter to detect class file which uses log function
      - parameter function: String internal parameter to detect function which uses log function
      - parameter line: Int string internal parameter to detect line number which uses log function
     */
    public func log(type: LightyMessageType,
                    message: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        let fileUrl = URL(fileURLWithPath: file)
        let fileExtension = fileUrl.pathExtension
        let fileName = fileUrl.deletingPathExtension().lastPathComponent

        let trackedString = "\(fileName).\(fileExtension):\(line) \(function)"
        
        print(type.rawValue + " " + dateFormatter.string(from: Date()) + separator + trackedString + separator +  message)
    }

    /**
     Function for print debug logs
     - parameter type: LightyMessageType
     - parameter message: Message string to log
     - parameter file: String internal parameter to detect class file which uses log function
     - parameter function: String internal parameter to detect function which uses log function
     - parameter line: Int string internal parameter to detect line number which uses log function
     */
    public func dlog(type: LightyMessageType,
                    message: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        #if DEBUG
            let fileUrl = URL(fileURLWithPath: file)
            let fileExtension = fileUrl.pathExtension
            let fileName = fileUrl.deletingPathExtension().lastPathComponent

            let trackedString = "\(fileName).\(fileExtension):\(line) \(function)"
            
            print(type.rawValue + " " + dateFormatter.string(from: Date()) + separator + trackedString + separator +  message)
        #endif
    }
    
}
