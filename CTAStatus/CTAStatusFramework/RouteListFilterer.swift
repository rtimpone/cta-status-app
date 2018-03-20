//
//  RouteListFilterer.swift
//  CTAStatusFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

struct RouteListFilterer {
    
    static func filterNonTrainRoutes(fromList list: RoutesList) -> [Route] {
        return list.routes.filter { $0.isTrainRoute }
    }
}

private extension Route {
    
    var isTrainRoute: Bool {
        return name.range(of: " Line") != nil
    }
}
