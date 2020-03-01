//
//  Decodable+Decode.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 01/03/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import Foundation

extension Decodable {
  static func decode(fromJSON data: Data) throws -> Self {
    try JSONDecoder().decode(Self.self, from: data)
  }
}
