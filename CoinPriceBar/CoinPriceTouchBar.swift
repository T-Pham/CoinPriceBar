//
//  CoinPriceTouchBar.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBar: NSTouchBar {

  var BTCPrice: String? {
    didSet {
      bitCoinItem.price = BTCPrice
      mesItem.prices[.BTC] = BTCPrice
    }
  }

  var ETHPrice: String? {
    didSet {
      ethereumItem.price = ETHPrice
      mesItem.prices[.ETH] = ETHPrice
    }
  }

  var LTCPrice: String? {
    didSet {
      liteCoinItem.price = LTCPrice
      mesItem.prices[.LTC] = LTCPrice
    }
  }

  let bitCoinItem = CoinPriceTouchBarItem(coin: .BTC)
  let ethereumItem = CoinPriceTouchBarItem(coin: .ETH)
  let liteCoinItem = CoinPriceTouchBarItem(coin: .LTC)

  let mesItem: MesTouchBarItem = {
    let mesProvider = MesProvider()
    let prices = mesProvider.getMes()
    return MesTouchBarItem(mes: prices)
  }()

  override init() {
    super.init()
    templateItems = NSSet(objects: bitCoinItem, ethereumItem, liteCoinItem, mesItem) as! Set
    defaultItemIdentifiers = [.flexibleSpace, bitCoinItem.identifier, .flexibleSpace, ethereumItem.identifier, .flexibleSpace, liteCoinItem.identifier, .flexibleSpace, mesItem.identifier, .fixedSpaceLarge]
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
