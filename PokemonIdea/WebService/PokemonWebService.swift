//
//  PokemonWebService.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 28/02/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import Foundation
import Output


protocol PokemonWebServiceDelegate {
  func didRecievePokemon(pokemon: Pokemon)
}


class PokemonWebService {
  
  var delegate: PokemonWebServiceDelegate?
  
  func requestURL(withURL url: URL) {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      self.handleData(withData: data)
      self.handleResponse(withResponse: response)
      self.handleError(withError: error)
      
      self.decodePokemon(withData: data)
    }
    task.resume()
  }
  
  func decodePokemon(withData data: Data?) {
    guard let data = data else {
      return log("Problem with JSON Data!")
    }
    guard let pokemon = try? Pokemon.decode(fromJSON: data) else {
      return log("Problem decoding Pokemon from JSON!")
    }
    passDataToController(withPokemon: pokemon)
  }
  
  func passDataToController(withPokemon pokemon: Pokemon) {
    self.delegate?.didRecievePokemon(pokemon: pokemon)
  }
  
}


extension PokemonWebService: TaskCompletionHandlerProtocol {
  
  func handleResponse(withResponse response: URLResponse?) {
    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
      return log(.failure("Server Error!"))
    }
  }
  
  func handleError(withError error: Error?) {
    if error != nil {
      return log(.failure("Client Error!"))
    }
  }
  
  func handleData(withData data: Data?) {
    if data == nil {
      return log(.failure("Returned no Data!"))
    }
  }
  
}


