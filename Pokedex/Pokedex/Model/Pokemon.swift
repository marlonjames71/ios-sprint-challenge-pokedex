//
//  Pokemon.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


struct Pokemon: Codable {
	let id: Int
	let name: String
	let type: String
	let ability: String
	let imageURL: String
}

struct PokemonSearch: Decodable {
	let results: [Pokemon]
}
