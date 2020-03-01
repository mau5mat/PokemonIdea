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
      
      let pokemon = try? Pokemon.decode(fromJSON: data!)
      self.delegate?.didRecievePokemon(pokemon: pokemon!)
      
    }
    task.resume()
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


