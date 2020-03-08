//
//  PokemonCollectionViewCell.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 03/03/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private var pokemonName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func setupCell(withPokemon pokemon: Pokemon) {
    pokemonName.text = pokemon.name
  }

}
