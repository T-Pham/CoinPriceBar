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
      mesItem.prices = prices
    }
  }

  private var items: [CoinPriceTouchBarItem] = supportedCoins.map { CoinPriceTouchBarItem(coin: $0) }

  let mesItem: MesTouchBarItem = {
    let mesProvider = MesProvider()
    let prices = mesProvider.getMes()
    return MesTouchBarItem(mes: prices)
  }()

  override init() {
    super.init()
    templateItems = Set(items as [NSTouchBarItem] + [mesItem])
    defaultItemIdentifiers = items.flatMap { [$0.identifier, .flexibleSpace] } + [mesItem.identifier]
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
