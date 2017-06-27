//
//  HomeController.swift
//  Pokedex
//
//  Created by Rafael Ferreira on 6/25/17.
//  Copyright © 2017 Swift Yah. All rights reserved.
//

import UIKit

final class HomeController: UITableViewController {
    var trainer: TrainerQuery.Data.Trainer? {
        didSet { tableView.reloadData() }
    }
}

// MARK: UIViewController functions

extension HomeController {
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchTrainer()
    }
}

// MARK: Private functions

private extension HomeController {
    func fetchTrainer() {
        let trainerQuery = TrainerQuery(name: "Rafael da Silva Ferreira")

        APIClient.apollo.fetch(query: trainerQuery) { result, error in
            if let error = error {
                return self.onFailTrainerFetch(error: error)
            }

            self.onTrainerFetch(trainer: result?.data?.trainer)
        }
    }

    func onTrainerFetch(trainer: TrainerQuery.Data.Trainer?) {
        guard let trainer = trainer else { return }

        self.trainer = trainer
    }

    func onFailTrainerFetch(error: Error) {
        print(error)
    }
}

// MARK: UITableViewDataSource conforms

extension HomeController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let pokemons = trainer?.ownedPokemons, !pokemons.isEmpty else { return 1 }
        
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = indexPath.section == 0 ? "PokedexStatus" : "Pokedex"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let count = trainer?.ownedPokemonsMeta.count ?? 0
        
        cell.textLabel?.numberOfLines = 0
        
        switch indexPath.section {
        case 0:
            let greeting: String
            
            if let name = trainer?.name?.components(separatedBy: " ").first {
                greeting = "Hello \(name), you have \(count) Pokemons in your Pokedex."
            } else {
                greeting = "Hello, you have \(count) Pokemons in your Pokedex."
            }
            
            cell.textLabel?.text = greeting
            
        case 1:
            if let pokemon = trainer?.ownedPokemons?[indexPath.row] {
                (cell as? PokedexViewCell)?.setup(model: pokemon)
            }
            
        default: break
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return trainer?.ownedPokemons?.count ?? 0
        default: return 0
        }
    }
}

// MARK: UITableViewDelegate conforms

extension HomeController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
