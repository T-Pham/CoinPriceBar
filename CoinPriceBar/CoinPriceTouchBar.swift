//
//  CoinPriceTouchBar.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBar: NSTouchBar {

  var prices: [Coin: String] = [:] {
    didSet {
      items.forEach { $0.price = prices[$0.coin] }
    }
  }

  private var items: [CoinPriceTouchBarItem] = supportedCoins.map { CoinPriceTouchBarItem(coin: $0) }

  override init() {
    super.init()
    templateItems = Set(items)
    defaultItemIdentifiers = [.fixedSpaceSmall, .flexibleSpace] + items.flatMap { [$0.identifier, .flexibleSpace] } + [.fixedSpaceSmall]
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
