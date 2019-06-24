//
//  PokedexTableViewController.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {

	let apiController = APIController()
	
	var pokemon: Pokemon! {
		didSet {
			tableView.reloadData()
		}
	}
	
//	var pokemonCollection: [Pokemon] = [] {
//		didSet {
//			tableView.reloadData()
//		}
//	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apiController.pokemon.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        let pokemonCharacter = apiController.pokemon[indexPath.row]
		cell.textLabel?.text = pokemonCharacter.name

        return cell
    }

	
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowPokemonDetailSegue" {
			if let detailVC = segue.destination as? SearchDetailViewController,
				let indexPath = tableView.indexPathForSelectedRow {
					detailVC.pokemon = apiController.pokemon[indexPath.row]
					detailVC.hideSearchStuff()
			}
		} else if segue.identifier == "SearchPokemonSegue" {
			if let searchVC = segue.destination as? SearchDetailViewController {
				searchVC.apiController = apiController
			}
		}
    }
}
