//
//  PetCardStore.swift
//  PresentationGuessThePet
//
//  Created by Jon Olivet on 9/28/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.

import UIKit

struct PetCardStore {
  
  static func defaultPets() -> [PetCard] {
    return parsePets()
  }
  
  private static func parsePets() -> [PetCard] {
    
    let filePath = Bundle.main.path(forResource: "Pets", ofType: "plist")!
    let dictionary = NSDictionary(contentsOfFile: filePath)!
    let petData = dictionary["Pets"] as! [[String : String]]
    
    let pets = petData.map { dict -> PetCard in
      return PetCard(
        name: dict["name"]!,
        description: dict["description"]!,
        image: UIImage(named: dict["image"]!)!)
    }
    return pets
  }
}
