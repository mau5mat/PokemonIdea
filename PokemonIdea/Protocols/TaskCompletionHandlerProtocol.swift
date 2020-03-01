//
//  TaskCompletionHandlerProtocol.swift
//  PokemonIdea
//
//  Created by Matt Roberts on 01/03/2020.
//  Copyright © 2020 Matt Roberts. All rights reserved.
//

import Foundation

protocol TaskCompletionHandlerProtocol {
  func handleData(withData data: Data?)
  func handleResponse(withResponse response: URLResponse?)
  func handleError(withError error: Error?)
}

