//
//  PokedexViewCell.swift
//  Pokedex
//
//  Created by Rafael Ferreira on 6/27/17.
//  Copyright © 2017 Swift Yah. All rights reserved.
//

import Kingfisher

final class PokedexViewCell: UITableViewCell {
    @IBOutlet weak fileprivate var pokemonImageView: UIImageView!
    @IBOutlet weak fileprivate var nameLabel: UILabel!
}

// MARK: Functions

extension PokedexViewCell {
    func setup(model: TrainerQuery.Data.Trainer.OwnedPokemon) {
        if let urlString = model.url, let url = URL(string: urlString) {
            pokemonImageView.kf.setImage(with: url)
        }
        
        nameLabel.text = model.name
    }
}
