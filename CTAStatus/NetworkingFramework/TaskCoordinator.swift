//
//  TaskSender.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

protocol TaskCoordinator {
    
    associatedtype typeToParseInto
    var parser: Parser<typeToParseInto> { get }
}

extension TaskCoordinator {
    
    public func sendTaskAndParseResponse<T: Decodable>(_ task: NetworkTask<T>, completion: @escaping (Result<[typeToParseInto]>) -> Void) {
        
        TaskSender.sendTask(task) { result in
            
            switch result {
            case .success(let data):
                
                guard let parsedObject = self.parser.parse(data: data) else {
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

public struct JSONTaskCoordinator<T: Decodable>: TaskCoordinator {

    typealias typeToParseInto = T
    var parser: Parser<T> = JSONParser<T>()
    
    public init() {}
}
