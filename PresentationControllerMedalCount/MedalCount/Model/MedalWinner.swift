//
//  MedalWinner.swift
//  MedalCount
//
//  Created by Jon Olivet on 9/25/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import UIKit

struct MedalWinner {

  // MARK: - Properties
  let country: String
  let gold: Int
  let silver: Int
  let bronze: Int

  // MARK: - Initializers
  init(dictionary: [String: AnyObject]) {
    self.country = dictionary["country"] as! String
    self.gold = dictionary["gold"] as! Int
    self.silver = dictionary["silver"] as! Int
    self.bronze = dictionary["bronze"] as! Int
  }
}

// MARK: - Internal
extension MedalWinner {
  
  var flagImage: UIImage? {
    let imageName = country.lowercased().replacingOccurrences(of: " ", with: "_")
    return UIImage(named: imageName)
  }
  
  var goldString: String {
    return "\(gold)"
  }
  
  var silverString: String {
    return "\(silver)"
  }
  
  var bronzeString: String {
    return "\(bronze)"
  }
}

// MARK: - CustomStringConvertible
extension MedalWinner: CustomStringConvertible {

  var description: String {
    return "\(country) - Gold:\(gold), Silver:\(silver), Bronze:\(bronze)"
  }
}
