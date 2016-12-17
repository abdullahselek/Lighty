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

public enum LightyColor: String {
    case white = "\u{001B}[0;37m" // white
    case blue = "\u{001B}[0;34m" // blue
    case green = "\u{001B}[0;32m" // green
    case yellow = "\u{001B}[0;33m" // yellow
    case red = "\u{001B}[0;31m" // red
    case foreground = "\u{001B}[0;39m" // default foreground color
    case background = "\u{001B}[0;49m" // default background color
}

public enum LightyMessageType {
    case verbose
    case debug
    case info
    case warn
    case error
}

public class LightyLogger {

    internal func getColorWithType(messageType: LightyMessageType) -> LightyColor {
        switch messageType {
        case .verbose:
            return .white
        case .debug:
            return .blue
        case .info:
            return .green
        case .warn:
            return .yellow
        case .error:
            return .red
        }
    }
    
}
