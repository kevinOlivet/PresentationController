//
//  GamesDataStore.swift
//  MedalCount
//
//  Created by Jon Olivet on 9/25/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import Foundation

final class GamesDataStore {

  // MARK: - Properties
  private(set) var summer: [Games] = []
  private(set) var winter: [Games] = []

  // MARK: - Initializers
  init() {
    let path = Bundle.main.path(forResource: "GamesData", ofType: "plist")
    let rawData = NSDictionary(contentsOfFile: path!) as! [String: [[String: AnyObject]]]

    let rawSummer = rawData["summer"]!.reversed()
    for raw in rawSummer {
      self.summer.append(Games(dictionary: raw))
    }

    let rawWinter = rawData["winter"]!.reversed()
    for raw in rawWinter {
      self.winter.append(Games(dictionary: raw))
    }
  }
}
