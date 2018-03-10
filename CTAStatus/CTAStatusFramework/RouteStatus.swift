//
//  RouteStatus.swift
//  CTAStatusFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

///Top-level JSON dictionary container for route status information
struct RouteInfo: Decodable {
    
    let routesList: RoutesList
    
    enum CodingKeys: String, CodingKey {
        case routesList = "CTARoutes"
    }
}

///A JSON array containing route status dictionaries
struct RoutesList: Decodable {
    
    let routes: [Route]
    
    enum CodingKeys: String, CodingKey {
        case routes = "RouteInfo"
    }
}

///A JSON dictionary with information about a bus or train route
public struct Route: Decodable {
    
    public let name: String
    public let status: String
    public let routeBackgroundColorHexValue: String
    public let routeTextColorHexValue: String

    enum CodingKeys: String, CodingKey {
        case name = "Route"
        case status = "RouteStatus"
        case routeBackgroundColorHexValue = "RouteColorCode"
        case routeTextColorHexValue = "RouteTextColor"
    }
}
