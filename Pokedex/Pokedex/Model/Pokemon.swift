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
	let name: Species
	let type: Types
	let ability: Abilities
}


struct Abilities: Codable {
	let abilities: [Ability]
}

struct Species: Codable {
	let name: String
}

struct Ability: Codable {
	let name: String
}

struct Types: Codable {
	let types: [Type]
}

struct Type: Codable {
	let name: String
}

struct PokemonSearch: Decodable {
	let results: [Pokemon]
}
