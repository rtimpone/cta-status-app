//
//  ViewController.swift
//  CTAStatus
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CTAStatusFramework
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StatusFetcher.fetchTrainRoutes() { result in
            
            switch result {
            case .success(let routes):
                for route in routes {
                    print("\(route.name): \(route.status)")
                }
            case .failure:
                print("failed to get route statuses")
            }
        }
    }
}
