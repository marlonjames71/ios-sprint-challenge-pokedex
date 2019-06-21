//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Marlon Raskin on 6/21/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

	var pokedexTableViewController: PokedexTableViewController?
	
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var idLabel: UILabel!
	@IBOutlet var abilityLabel: UILabel!
	@IBOutlet var typeLabel: UILabel!
	
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

	@IBAction func deleteButtonTapped(_ sender: UIButton) {
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
