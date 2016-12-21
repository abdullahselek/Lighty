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
#if os(OSX)
    import Cocoa
#elseif os(iOS) || os(tvOS)
    import UIKit
#endif

public enum LightyMessageType {
    case verbose
    case debug
    case info
    case warn
    case error
}

private struct Emoji {
    static let Empty = ""
    static let Verbose = "💜"
    static let Debug = "💙"
    static let Info = "💚"
    static let Warn = "💛"
    static let Error = "❤️"
}

public class LightyLogger {

    public static let sharedInstance: LightyLogger = LightyLogger()

    internal func getAccessoryWithType(messageType: LightyMessageType) -> String {
        switch messageType {
        case .verbose:
            return Emoji.Verbose
        case .debug:
            return Emoji.Debug
        case .info:
            return Emoji.Info
        case .warn:
            return Emoji.Warn
        case .error:
            return Emoji.Error
        }
    }

    internal func track(message: String, file: String = #file, function: String = #function, line: Int = #line) -> String {
        return message + " called from \(#function) \(#file):\(#line)"
    }

    public func log(type: LightyMessageType,
                    message: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {

        let fileExtension = file.nsstring.lastPathComponent.nsstring.pathExtension
        let fileName = file.nsstring.lastPathComponent.nsstring.deletingPathExtension

        let trackedString = "\(fileName).\(fileExtension):\(line) \(function)"
        let emoji = getAccessoryWithType(messageType: type)
        print(emoji + " " + trackedString + " / " +  message + " " + emoji)
    }
    
}

private extension String {

    var nsstring: NSString { return self as NSString }

}
