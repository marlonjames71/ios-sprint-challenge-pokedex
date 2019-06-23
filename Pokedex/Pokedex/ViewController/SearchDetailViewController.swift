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
	
	var pokemon: Pokemon?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
    }
	
	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
	}
	
	@IBAction func deleteButtonTapped(_ sender: UIButton) {
	}
	
	
	func updateViews() {
		guard let apiController = self.apiController else { return }
		pokemonNameLabel.text = pokemon?.name
	}

}

extension SearchDetailViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ sender: UISearchBar) {
		guard let searchTerm = searchBar.text,
			let apiController = apiController else { return }
		apiController.fetchPokemon(pokemonName: searchTerm) { (pokemonObject, error) in
			if let error = error {
				print("Error searching pokemon: \(error)")
				return
			}
			guard let pokeObject = pokemonObject else { return }
			DispatchQueue.main.async {
				self.updateViews()
			}
		}
	}
}
