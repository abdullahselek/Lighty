[![Build Status](https://travis-ci.org/abdullahselek/Lighty.svg?branch=master)](https://travis-ci.org/abdullahselek/Lighty)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Lighty.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Coverage Status](https://coveralls.io/repos/github/abdullahselek/Lighty/badge.svg?branch=master)](https://coveralls.io/github/abdullahselek/Lighty?branch=master)
[![Platform](https://img.shields.io/cocoapods/p/Lighty.svg?style=flat)](https://cocoapods.org/pods/Lighty)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/abdullahselek/Lighty/blob/master/LICENSE)

# Lighty
Easy to use and lightweight logger for iOS, macOS, tvOS, watchOS and Linux in Swift.

## Screenshots

![default_theme](https://github.com/abdullahselek/Lighty/blob/master/Screenshots/default_theme.png)
![dark_theme](https://github.com/abdullahselek/Lighty/blob/master/Screenshots/dark_theme.png)

## Requirements

| Lighty Version | Minimum iOS Target | Minimum OS X Target | Minimum watchOS Target | Minimum tvOS Target | Swift Version |
|:--------------------:|:---------------------------:|:---------------------------:|:--------------------:|:---------------------------:|:---------------------------:|
| 1.1.8 | iOS 10 | OS X 10.11 | watchOS 3.0 | tvOS 10.0 | Swift 5 |
| 1.1.7 | iOS 9 | OS X 10.9 | watchOS 2.0 | tvOS 9.0 | Swift 4.2 |
| 1.1.6 | iOS 9 | OS X 10.9 | watchOS 2.0 | tvOS 9.0 | Swift 4.1 |
| 1.1.5 | iOS 9 | OS X 10.9 | watchOS 2.0 | tvOS 9.0 | Swift 4.0 |
| 1.1.4 | iOS 9 | OS X 10.9 | watchOS 2.0 | tvOS 9.0 | Swift 3.x |

## CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```	
$ gem install cocoapods
```

To integrate Lighty into your Xcode project using CocoaPods, specify it in your Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'Lighty', '~>1.1.8'
end
```

Then, run the following command:
```
$ pod install
```

## Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with Homebrew using the following command:

```
brew update
brew install carthage
```

To integrate Lighty into your Xcode project using Carthage, specify it in your Cartfile:

```
github "abdullahselek/Lighty" ~> 1.1.8
```

Run carthage update to build the framework and drag the built Lighty.framework into your Xcode project.

## Swift Package Manager

Modify your Package.swift file to include the following dependency:

```
.package(url: "https://github.com/abdullahselek/Lighty.git", from: "1.1.8")
```

Run  `swift package resolve`

## Example Usage
```
import Lighty
````

```
let logger = LightyLogger.sharedInstance

logger.log(type: .verbose, message: "Verbose")
logger.log(type: .debug, message: "Debug")
logger.log(type: .info, message: "Info")
logger.log(type: .warn, message: "Warn")

LightyLogger.sharedInstance.log(type: .error, message: "Error for test :)")
```

or globally add an instance to `AppDelegate`

```
import Lighty

let logger = LightyLogger.sharedInstance

class AppDelegate: UIResponder, UIApplicationDelegate {
    ...
}
```

and you can reach `logger` instance from module classes.

You can set your own date formatter and separator
```
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .long
dateFormatter.timeStyle = .long
logger.dateFormatter = dateFormatter
```

```
logger.separator = " + "
```

Enable/Disable formatted date logs
```
logger.enableDate = false
```

Enable/Disable logging
```
logger.enable = false
```

Logs for just debug mode
```
logger.dlog(type: .warn, message: "Log for just debug mode")
```
