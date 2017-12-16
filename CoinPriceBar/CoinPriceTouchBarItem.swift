//
//  CoinPriceTouchBarItem.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBarItem: NSTouchBarItem {

  let coin: Coin

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
    self.coin = coin
    super.init(identifier: NSTouchBarItem.Identifier(rawValue: self.coin.rawValue))
    textField.stringValue = identifier.rawValue
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func reloadText() {
    if let price = price {
      textField.stringValue = "\(coin.unicode()) \(price)"
    }
  }
}
