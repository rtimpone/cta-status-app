//
//  TaskSender.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public struct TaskCoordinator {
    
    public static func sendTaskAndParseJSONResponse<T: Decodable>(_ task: NetworkTask<T>, completion: @escaping (Result<[T]>) -> Void) {
        
        TaskSender.sendTask(task) { result in
            
            switch result {
            case .success(let data):
                
                guard let parsedObject = ResponseParser.parse(jsonData: data, intoType: T.self) else {
                    completion(.failure)
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.success([parsedObject]))
                }
                
            case .failure:
                
                DispatchQueue.main.async {
                    completion(.failure)
                }
            }
        }
    }
}
