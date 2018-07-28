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

  private var textField: NSTextField = {
    let textField = NSTextField(labelWithString: "")
    textField.font = NSFont.systemFont(ofSize: 10)
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

  private func reloadText() {
    guard let price = price else { return }
    let coinSymbol = coin.unicode()
    let string = "\(coinSymbol) \(price)"
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttribute(.foregroundColor, value: coin.color(), range: (string as NSString).range(of: coinSymbol))
    textField.attributedStringValue = attributedString
  }
}
