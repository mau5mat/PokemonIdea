//
//  Data+Decode.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 01/03/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import Foundation

extension Data {
  func decode<T: Decodable>(as: T.Type) throws -> T {
    try JSONDecoder().decode(T.self, from: self)
  }
}
