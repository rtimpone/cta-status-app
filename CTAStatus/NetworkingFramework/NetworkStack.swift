//
//  NetworkStack.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public struct NetworkStack {
    
    var taskSender: TaskSender
    var logger: ResponseLogger
    var parser: Parser
    
    init(taskSender: TaskSender, logger: ResponseLogger, parser: Parser) {
        self.taskSender = taskSender
        self.logger = logger
        self.parser = parser
    }
    
    public func processTask<T>(_ task: NetworkTask<T>, completion: @escaping (Result<[T]>) -> Void) where T: Parsable {
        
        taskSender.sendTask(task) { response, result in
            
            if let response = response {
                self.logger.logResponse(response)
            }
            
            switch result {
            case .success(let data):

                guard let parsedObject = self.parser.parse(type: T.self, from: data) else {
                    completion(.failure)
                    return
                }

                DispatchQueue.main.async {
                    let parsedObjects = [parsedObject]
                    completion(.success(parsedObjects))
                }

            case .failure:

                DispatchQueue.main.async {
                    completion(.failure)
                }
            }
        }
    }
}
