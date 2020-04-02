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
  @IBOutlet private var pokemonSprite: UIImageView!
  @IBOutlet private var pokemonID: UILabel!
  @IBOutlet private var pokemonHeight: UILabel!
  @IBOutlet private var pokemonWeight: UILabel!
  @IBOutlet private var pokemonBaseExperience: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func setupCell(withPokemon pokemon: Pokemon) {
    setPokemonSpriteImage(withPokemon: pokemon)
    
    pokemonName.text = pokemon.name
    pokemonID.text = "Pokemon ID: \(pokemon.id)"
    pokemonHeight.text = "Pokemon Height: \(pokemon.height)"
    pokemonWeight.text = "Pokemon Weight: \(pokemon.weight)"
    pokemonBaseExperience.text = "Pokemon Base Experience: \(pokemon.baseExperience)"
  }
  
  func setPokemonSpriteImage(withPokemon pokemon: Pokemon) {
    let pokemonImageURL = pokemon.sprites.frontDefault
    pokemonSprite.setImage(fromURL: pokemonImageURL)
  }

}
