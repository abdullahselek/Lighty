//
//  AppDelegate.swift
//  LightySample macOS
//
//  Created by Abdullah Selek on 21/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import Cocoa
import Lighty

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let logger = LightyLogger.sharedInstance
        logger.log(type: .verbose, message: "Verbose")
        logger.log(type: .debug, message: "Debug")
        logger.log(type: .info, message: "Info")
        logger.log(type: .warn, message: "Warn")
        
        LightyLogger.sharedInstance.log(type: .error, message: "Error for test :)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

