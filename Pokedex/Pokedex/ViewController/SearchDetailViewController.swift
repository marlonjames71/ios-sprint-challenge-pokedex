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
		updateViews()
		searchBar.delegate = self
    }
	
	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
		guard let pokemon = pokemon else { return }
		apiController?.pokemon.append(pokemon)
		self.navigationController?.popToRootViewController(animated: true)
	}
	
	@IBAction func deleteButtonTapped(_ sender: UIButton) {
	}
	
	
	func hideSearchStuff() {
		loadViewIfNeeded()
		searchBar.isHidden = true
		saveButton.style = .done
	}
	
	func updateViews() {
//		guard let apiController = self.apiController else { return }
		guard isViewLoaded else { return }
		guard let pokemonObject = pokemon else { return }
		pokemonNameLabel.text = pokemon?.name.capitalized
		idLabel.text = "ID: \(pokemonObject.id)"
		
		var types: [String] = []
		for typeInfo in pokemonObject.types {
			types.append(typeInfo.type.name)
		}
		
		typeLabel.text = "Type: \(types.joined(separator: ", "))"
		abilityLabel.text = "Abilities: \(pokemonObject.abilities[0].ability.name)"
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
		guard let pokemonImgUrl = pokemon?.sprites.imageUrl else { return }
		apiController.fetchImage(at: pokemonImgUrl) { (pokemonImage) in
			DispatchQueue.main.async {
//				self.imageView.image = pokemonImage
			}
		}
	}
}
