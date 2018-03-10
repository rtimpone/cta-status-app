//
//  NetworkTask.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public struct NetworkTask<T> {
    
    var url: URL
    
    public init(url: URL) {
        self.url = url
    }
}
