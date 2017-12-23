//
//  CoinPriceTouchBarController.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBarController: NSViewController {

  private let priceRefreshInterval: TimeInterval = 15
  private let coinPriceTouchBar = CoinPriceTouchBar()

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func loadView() {
    self.view = NSView()
  }

  override func makeTouchBar() -> NSTouchBar? {
    return coinPriceTouchBar
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    for coin in supportedCoins {
      getPrice(of: coin)
    }
  }

  private func getPrice(of coin: Coin) {
    coin.priceProvider().getPrice(of: coin, in: currency) { [weak self] price in
      guard let sself = self else { return }
      sself.coinPriceTouchBar.prices[coin] = price
      Timer.scheduledTimer(withTimeInterval: sself.priceRefreshInterval, repeats: false) { [weak sself] _ in
        sself?.getPrice(of: coin)
      }
    }
  }
}
