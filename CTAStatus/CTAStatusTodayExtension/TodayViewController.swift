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

class TodayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableDataSource: TodayTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
}

extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdate(completionHandler: @escaping (NCUpdateResult) -> Void) {
        
        RoutesFetcher.fetchTrainRoutes() { result in
            
            switch result {
            case .success(let routes):
                let sortedRoutes = RoutesSorter.sortRoutes(routes)
                self.tableDataSource.reloadTable(withRoutes: sortedRoutes)
            case .failure:
                print("Today extension failed to fetch train routes")
            }
        }
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        switch activeDisplayMode {
        case .compact:
            preferredContentSize = maxSize
        case .expanded:
            preferredContentSize = tableView.contentSize
        }
    }
}
