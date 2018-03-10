//
//  TodayViewController.swift
//  CTAStatusTodayExtension
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CTAStatusFramework
import NotificationCenter
import UIKit

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FrameworkTest.printHelloFramework()
    }
}
