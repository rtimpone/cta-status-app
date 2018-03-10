//
//  ResponseLogger.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

protocol ResponseLogger {
    
    func logResponse(_ response: URLResponse)
}

struct ConsoleResponseLogger: ResponseLogger {
    
    func logResponse(_ response: URLResponse) {
        
        var statusCode = "UNKNOWN STATUS CODE"
        if let httpResponse = response as? HTTPURLResponse {
            statusCode = String(httpResponse.statusCode)
        }
        
        var url = "UNKNOWN URL"
        if let responseURL = response.url {
            url = responseURL.absoluteString
        }
        
        let message = "(\(statusCode)) \(url)"
        print(message)
    }
}
