//
//  ViewController.swift
//  LightySample
//
//  Created by Abdullah Selek on 19/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit
import Lighty

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        LightyLogger.sharedInstance.log(type: .error, message: "Error for test :)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

