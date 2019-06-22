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
	
	var apiController: APIController?
	var pokemon: Pokemon?
	
	
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
	
	
	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
	}
	
	@IBAction func deleteButtonTapped(_ sender: UIButton) {
	}
	
	func searchBarButtonSearchButtonClicked(_ sender: UISearchBar) {
		guard let searchTerm = searchBar.text,
			let apiController = apiController else { return }
		apiController.fetchPokemon(pokemonName: searchTerm) { (pokemonObject) in
	
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
