//
//  APIClient.swift
//  Pokedex
//
//  Created by Rafael Ferreira on 6/26/17.
//  Copyright © 2017 Swift Yah. All rights reserved.
//

import Apollo

struct APIClient {
    static let apollo = ApolloClient(url: EnvironmentVariable.baseURL.url)
    
    // MARK: Non-argument initializer
    
    private init() { }
}
