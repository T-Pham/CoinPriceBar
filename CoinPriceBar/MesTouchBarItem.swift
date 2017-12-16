//
//  MesTouchBarItem.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 16/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class MesTouchBarItem: NSTouchBarItem {

  var prices: [Coin: String] = [:] {
    didSet {
      reloadText()
    }
  }

  let mes: [String: Float]

  var textField: NSTextField = {
    let textField = NSTextField(labelWithString: "")
    return textField
  }()

  override var view: NSView? {
    return textField
  }

  init(mes: [String: Float]) {
    self.mes = mes
    super.init(identifier: NSTouchBarItem.Identifier(rawValue: String(describing: type(of: self))))
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func reloadText() {
    let sum = mes.reduce(Float(0)) { sum, mes in
      var currentSum = sum
      if let coin = Coin(rawValue: mes.key), let priceString = prices[coin], let price = Float(priceString) {
        currentSum += price * mes.value
      }
      return currentSum
    }
    textField.stringValue = "$\(Int(sum))"
  }
}
