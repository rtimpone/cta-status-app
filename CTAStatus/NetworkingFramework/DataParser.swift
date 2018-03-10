//
//  DataParser.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

protocol Parser {
    static func parse<T: Decodable>(jsonData data: Data, intoType type: T.Type) -> T?
}

struct ResponseParser: Parser {
    
    static func parse<T: Decodable>(jsonData data: Data, intoType type: T.Type) -> T? {
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
        catch {
            print("Parser was unable to parse json data into type '\(type)'")
            return nil
        }
    }
}
