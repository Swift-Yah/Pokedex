//
//  EnvironmentVariable.swift
//  Pokedex
//
//  Created by Rafael Ferreira on 6/26/17.
//  Copyright © 2017 Swift Yah. All rights reserved.
//

import class Foundation.Bundle
import struct Foundation.URL

enum EnvironmentVariable: String {
    case baseURL = "BASE_URL"
}

// MARK: Computed variables

extension EnvironmentVariable {
    var string: String {
        return value[rawValue] as! String
    }
    
    var url: URL {
        return URL(string: string)!
    }
}

// MARK: Private computed variables

extension EnvironmentVariable {
    var value: [String: AnyObject] {
        let id = String(describing: EnvironmentVariable.self)
        
        return Bundle.main.infoDictionary![id] as! [String: AnyObject]
    }
}
