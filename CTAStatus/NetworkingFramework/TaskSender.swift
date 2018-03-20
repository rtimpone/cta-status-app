//
//  TaskSender.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

protocol TaskSender {
    func sendTask<T>(_ task: NetworkTask<T>, completion: @escaping (URLResponse?, Result<Data>) -> Void)
}

struct URLSessionTaskSender: TaskSender {
    
    func sendTask<T>(_ task: NetworkTask<T>, completion: @escaping (URLResponse?, Result<Data>) -> Void) {
        
        let url = task.url
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //catch error codes here
            
            guard let data = data else {
                completion(response, .failure)
                return
            }
            
            completion(response, .success(data))
        }
        
        task.resume()
    }
}
