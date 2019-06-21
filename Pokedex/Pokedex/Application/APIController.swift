//
//  APIController.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
}

enum NetworkError: Error {
	case otherError
	case badData
	case noDecode
}

class APIController {
	
	private let baseUrl = URL(string: "https://pokeapi.co")
	
	
}
