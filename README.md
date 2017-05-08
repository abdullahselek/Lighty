[![Build Status](https://travis-ci.org/abdullahselek/Lighty.svg?branch=master)](https://travis-ci.org/abdullahselek/Lighty)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Lighty.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Coverage Status](https://coveralls.io/repos/github/abdullahselek/Lighty/badge.svg?branch=master)](https://coveralls.io/github/abdullahselek/Lighty?branch=master)
![Platform](https://img.shields.io/cocoapods/p/Lighty.svg?style=flat)
![License](https://img.shields.io/dub/l/vibe-d.svg)

# Lighty
Easy to use and lightweight logger for iOS, macOS, tvOS, watchOS and Linux in Swift.

## Screenshots
![default_theme](https://github.com/abdullahselek/Lighty/blob/master/Screenshots/default_theme.png)
![dark_theme](https://github.com/abdullahselek/Lighty/blob/master/Screenshots/dark_theme.png)

## Requirements

iOS 9.0+ / macOS 10.9+ / tvOS 9.0+ / watchOS 2.0+ / Linux

## CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```	
$ gem install cocoapods
```

To integrate Lighty into your Xcode project using CocoaPods, specify it in your Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'Lighty', '~>1.1.4'
end
```

Lighty now supports iOS 8, to use Lighty in iOS 8 with CocoaPods
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'Lighty', :git => 'https://github.com/abdullahselek/Lighty.git', :branch => 'ios8'
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
github "abdullahselek/Lighty" ~> 1.1.4
```

Lighty which supports iOS 8 with Carthage

```
git "https://github.com/abdullahselek/Lighty.git" "ios8"
```

Run carthage update to build the framework and drag the built Lighty.framework into your Xcode project.

## Swift Package Manager

```
import PackageDescription

let package = Package(
    name: "Your project name",
    dependencies: [
        .Package(url: "https://github.com/abdullahselek/Lighty.git", majorVersion: 1, minor: 1)
    ]
)
```

Run ```swift package fetch```

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