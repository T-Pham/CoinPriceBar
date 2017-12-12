//
//  CoinPriceTouchBarItem.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBarItem: NSTouchBarItem {

  var price: String? {
    didSet {
      reloadText()
    }
  }

  var textField: NSTextField = {
    let textField = NSTextField(labelWithString: "")
    return textField
  }()

  override var view: NSView? {
    return textField
  }

  init(coin: Coin) {
    super.init(identifier: NSTouchBarItem.Identifier(rawValue: coin.rawValue))
    textField.stringValue = identifier.rawValue
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func reloadText() {
    if let price = price {
      textField.stringValue = "\(identifier.rawValue): \(price)"
    }
  }
}
