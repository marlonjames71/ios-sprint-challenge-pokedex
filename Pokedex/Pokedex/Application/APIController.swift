//
//  APIController.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation
import UIKit

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
	
	var pokemon: [Pokemon] = []
	private let baseUrl = URL(string: "https://pokeapi.co/api/v2")
	
	
	// Fetch Pokemon Name
	func fetchPokemon(pokemonName: String, completion: @escaping () -> ()) {
		let pokemonUrl = baseUrl?.appendingPathComponent(pokemonName)
		guard let pokeUrl = pokemonUrl else { return }
		var request = URLRequest(url: pokeUrl)
		request.httpMethod = HTTPMethod.get.rawValue
		
		URLSession.shared.dataTask(with: request) { data, _, error in
			if let error = error {
				print("Error fetching data: \(error)")
				return
			}
			
			guard let data = data else {
				print("No data returned from data task.")
				return
			}
			
			let jsonDecoder = JSONDecoder()
			do {
				let pokemonSearch = try jsonDecoder.decode(PokemonSearch.self, from: data)
				self.pokemon = pokemonSearch.results
			} catch {
				print("Unable to decode data into object of type [Pokemon]: \(error)")
			}
			completion()
		}.resume()
	}
	
	func fetchImage(at urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
		let imageUrl = URL(string: urlString)!
		
		var request = URLRequest(url: imageUrl)
		request.httpMethod = HTTPMethod.get.rawValue
		
		URLSession.shared.dataTask(with: request) { data, _, error in
			if let _ = error {
				completion(.failure(.otherError))
				return
			}
			
			guard let data = data else {
				completion(.failure(.badData))
				return
			}
			
			let image = UIImage(data: data)!
			completion(.success(image))
		}.resume()
	}
}
