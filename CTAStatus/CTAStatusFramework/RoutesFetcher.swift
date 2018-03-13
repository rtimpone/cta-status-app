//
//  StatusFetcher.swift
//  CTAStatusFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation
import NetworkingFramework

public struct RoutesFetcher {
    
    public static func fetchTrainRoutes(completion: @escaping (Result<[Route]>) -> Void) {
        
        let url = URL(string: "http://www.transitchicago.com/api/1.0/routes.aspx?outputType=JSON")!
        let task = NetworkTask<RouteInfo>(url: url)
        let coordinator = JSONTaskCoordinator<RouteInfo>()
        
        coordinator.sendTaskAndParseResponse(task) { result in
            
            switch result {
            case .success(let routeInfos):
                
                guard let routesList = routeInfos.first?.routesList else {
                    completion(.failure)
                    return
                }
                
                let trainRoutes = RouteListFilerer.filterNonTrainRoutes(fromList: routesList)
                completion(.success(trainRoutes))
                
            case .failure:
                
                completion(.failure)
            }
        }
    }
}
