//
//  Result.swift
//  NetworkingFramework
//
//  Created by Rob Timpone on 3/10/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure
}
