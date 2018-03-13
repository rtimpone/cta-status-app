//
//  TaskSender.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

protocol TaskSender {
    
    associatedtype TaskType
    func sendTask(_ task: NetworkTask<TaskType>, completion: @escaping (Result<Data>) -> Void)
}

struct URLSessionTaskSender<T>: TaskSender {
    
    typealias TaskType = T
    
    func sendTask(_ task: NetworkTask<TaskType>, completion: @escaping (Result<Data>) -> Void) {
        
        let url = task.url
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure)
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
