//
//  NetworkStackFactory.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/19/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public struct NetworkStackFactory {
    
    public static func defaultNetworkStack() -> NetworkStack {
        
        let taskSender = URLSessionTaskSender()
        let parser = JSONParser()
        let logger = ConsoleResponseLogger()
        
        return NetworkStack(taskSender: taskSender, logger: logger, parser: parser)
    }
}
