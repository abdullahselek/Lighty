//
//  ViewController.swift
//  iOS Sample
//
//  Created by Abdullah Selek on 27/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit
import Lighty

class ViewController: UIViewController {

    let logger = LightyLogger.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        logger.log(type: .verbose, message: "Verbose")
        logger.log(type: .debug, message: "Debug")
        logger.log(type: .info, message: "Info")
        logger.log(type: .warn, message: "Warn")

        LightyLogger.sharedInstance.log(type: .error, message: "Error for test :)")

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long

        logger.dateFormatter = dateFormatter
        logger.log(type: .verbose, message: "Log with new formatter")

        logger.separator = " + "
        logger.log(type: .verbose, message: "Log with new separator")

        logger.dlog(type: .warn, message: "Log for just debug mode")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

