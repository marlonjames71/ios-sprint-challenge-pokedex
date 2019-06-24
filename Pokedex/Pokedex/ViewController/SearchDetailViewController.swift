//
//  SearchDetailViewController.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/22/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var pokemonNameLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var idLabel: UILabel!
	@IBOutlet var abilityLabel: UILabel!
	@IBOutlet var typeLabel: UILabel!
	@IBOutlet var saveButton: UIBarButtonItem!
	
	var apiController: APIController? {
		didSet {
			updateViews()
		}
	}
	
	var pokemon: Pokemon? {
		didSet {
			updateViews()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
    }
	
	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
		guard let pokemon = pokemon else { return }
		apiController?.pokemon.append(pokemon)
		self.navigationController?.popToRootViewController(animated: true)
	}
	
	@IBAction func deleteButtonTapped(_ sender: UIButton) {
	}
	
	
	func updateViews() {
//		guard let apiController = self.apiController else { return }
		guard isViewLoaded else { return }
		guard let pokemonObject = pokemon else { return }
		pokemonNameLabel.text = pokemon?.name.capitalized
		idLabel.text = "ID: \(pokemonObject.id)"
		
//		var types: [String]
//		for type in pokemonObject.types.first...pokemonObject.types.last {
//			types.append(type)
//		}
		
		typeLabel.text = "Type: \(pokemonObject.types[0].type.name)"
		abilityLabel.text = "Abilities: \(pokemonObject.abilities)"
	}

}

extension SearchDetailViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ sender: UISearchBar) {
		guard let searchTerm = searchBar.text,
			let apiController = apiController else {
				return
		}
		apiController.fetchPokemon(pokemonName: searchTerm) { (pokemonObject, error) in
			if let error = error {
				print("Error searching pokemon: \(error)")
				return
			}
			DispatchQueue.main.async {
				self.pokemon = pokemonObject
			}
		}
	}
}
