//
//  TaskSender.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

struct TaskSender {
    
    static func sendTask<T>(_ task: NetworkTask<T>, completion: @escaping (Result<Data>) -> Void) {
        
        let url = task.url
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let response = response {
                let logMessage = Logger.generateLog(from: response)
                print(logMessage)
            }
            
            guard let data = data else {
                completion(.failure)
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
