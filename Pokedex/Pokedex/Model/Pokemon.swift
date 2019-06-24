//
//  Pokemon.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Codable {
	let name: String
	let types: [TypeInfo]
	let abilities: [AbilityInfo]
	let id: Int
	
	struct AbilityInfo: Codable {
		let ability: Ability
		
		struct Ability: Codable {
			let name: String
		}
	}
	
	struct TypeInfo: Codable {
		let type: TypieType
		
		struct TypieType: Codable {
			let name: String
		}
	}
}



//
//struct Types: Codable {
//	let types: [Type]
//}
//
//struct Type: Codable {
//	let name: String
//}
//
//struct PokemonSearch: Decodable {
//	let results: [Pokemon]
//}
//
//struct Species: Codable {
//	let name: String
//}
//
