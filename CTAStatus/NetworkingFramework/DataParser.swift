//
//  DataParser.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

class Parser<T> {
    
    func parse(data: Data) -> T? {
        fatalError("To be implemented by a concrete subclass")
    }
}

class JSONParser<T: Decodable>: Parser<T> {
    
    override func parse(data: Data) -> T? {
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
        catch {
            print("Parser was unable to parse json data into type '\(String(describing: T.self))'")
            return nil
        }
    }
}
