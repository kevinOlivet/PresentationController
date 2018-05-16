//
//  MedalCountViewController.swift
//  MedalCount
//
//  Created by Jon Olivet on 9/25/17.
//  Copyright © 2017 Ron Kliffer. All rights reserved.
//

import UIKit

final class MedalCountViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var medalCountStackView: UIStackView!
  @IBOutlet var countryFlags: [UIImageView]!
  @IBOutlet var countryNames: [UILabel]!
  @IBOutlet var countryGolds: [UILabel]!
  @IBOutlet var countrySilvers: [UILabel]!
  @IBOutlet var countryBronzes: [UILabel]!

  // MARK: - Properties
  var medalCount: MedalCount!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    // Adding these constraints in code becuase storyboard froze when I tried adding the there
    medalCountStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      medalCountStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      medalCountStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])

    for (index, winner) in medalCount.winners.enumerated() {
      countryFlags[index].image = winner.flagImage
      countryNames[index].text = winner.country
      countryGolds[index].text = winner.goldString
      countrySilvers[index].text = winner.silverString
      countryBronzes[index].text = winner.bronzeString
    }

    setupGestureRecognizers()
  }
}

// MARK: - Private
private extension MedalCountViewController {

  func setupGestureRecognizers() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
    view.addGestureRecognizer(tapRecognizer)
  }
}

// MARK: - GestureRecognizerSelectors
private extension MedalCountViewController {

  dynamic func handleTap(gestureRecognizer: UITapGestureRecognizer) {
    dismiss(animated: true)
  }
}
