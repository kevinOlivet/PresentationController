//
//  MedalCount.swift
//  MedalCount
//
//  Created by Jon Olivet on 9/25/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import Foundation

struct MedalCount {

  // MARK: - Properties
  let winners: [MedalWinner]

  // MARK: - Initializers
  init(array: [[String: AnyObject]]) {
    var winnersArray: [MedalWinner] = []

    for rawWinner in array {
      winnersArray.append(MedalWinner(dictionary: rawWinner))
    }

    self.winners = winnersArray
  }
}

// MARK: - CustomStringConvertible
extension MedalCount: CustomStringConvertible {

  var description: String {
    var description = ""
    for (index, winner) in winners.enumerated() {
      description += "\(index). \(winner)\n"
    }
    return description
  }
}
