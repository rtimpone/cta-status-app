//
//  Parser.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public typealias Parsable = Decodable

public class Parser {
    
    func parse<T>(type: T.Type, from data: Data) -> T? where T: Parsable {
        fatalError("To be implemented by a concrete subclass")
    }
}

public class JSONParser: Parser {
    
    public override init() {}
    
    override func parse<T>(type: T.Type, from data: Data) -> T? where T: Parsable {
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        }
        catch {
            print("Parser was unable to parse json data into type '\(String(describing: type))'")
            return nil
        }
    }
}
