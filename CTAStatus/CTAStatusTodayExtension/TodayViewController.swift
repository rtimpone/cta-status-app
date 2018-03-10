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
    
    @IBOutlet var tableDataSource: TodayTableViewDataSource!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        RoutesFetcher.fetchTrainRoutes() { result in
            
            switch result {
            case .success(let routes):
                self.tableDataSource.reloadTable(withRoutes: routes)
            case .failure:
                print("Today extension failed to fetch train routes")
            }
        }
    }
}
