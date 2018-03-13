//
//  TodayTableDataSource.swift
//  CTAStatusTodayExtension
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CTAStatusFramework
import UIKit

class TodayTableViewDataSource: NSObject {
    
    @IBOutlet weak var tableView: UITableView!
    var routes = [Route]()
    
    func reloadTable(withRoutes routes: [Route]) {
        self.routes = routes
        tableView.reloadData()
    }
}

extension TodayTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todayCell") as? TodayTableViewCell else {
            return TodayTableViewCell()
        }
        
        let route = routes[indexPath.row]
        cell.updateLabels(for: route)
        return cell
    }
}
