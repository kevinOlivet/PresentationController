//
//  Games.swift
//  MedalCount
//
//  Created by Jon Olivet on 9/25/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import Foundation

struct Games {

  // MARK: - Properties
  let year: String
  let host: String
  let country: String
  let isSummer: Bool
  let medalCount: MedalCount

  var seasonYear: String {
    return "\(season.capitalized) \(year)"
  }

  var flagImageName: String {
    let name = country.lowercased().replacingOccurrences(of: " ", with: "_")
    return "\(name)_large"
  }

  private var season: String {
    return isSummer ? "summer" : "winter"
  }

  // MARK: - Initializers
  init(dictionary: [String: AnyObject]) {
    self.year = dictionary["year"] as! String
    self.host = dictionary["host"] as! String
    self.country = dictionary["country"] as! String
    self.isSummer = dictionary["isSummer"] as! Bool

    let rawMedals = dictionary["medal_count"] as! [[String: AnyObject]]
    self.medalCount = MedalCount(array: rawMedals)
  }
}

// MARK: - CustomStringConvertible
extension Games: CustomStringConvertible {

  var description: String {
    return "\(seasonYear) - \(host)\nMedal Winners:\n\(medalCount)"
  }
}
