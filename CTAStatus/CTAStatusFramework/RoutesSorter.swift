//
//  RoutesSorter.swift
//  CTAStatusFramework
//
//  Created by Rob Timpone on 3/12/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public struct RoutesSorter {
    
    public static func sortRoutes(_ routes: [Route]) -> [Route] {
        
        var sortedRoutes = [Route]()
        
        for route in routes.reversed() {
            
            if route.isRedLine || route.isBrownLine || route.isPurpleLineExpress {
                sortedRoutes.insert(route, at: 0)
            }
            else {
                sortedRoutes.append(route)
            }
        }
        
        return sortedRoutes
    }
}

private extension Route {
    
    var isRedLine: Bool {
        return name == "Red Line"
    }
    
    var isBrownLine: Bool {
        return name == "Brown Line"
    }
    
    var isPurpleLineExpress: Bool  {
        return name == "Purple Line Express"
    }
}
