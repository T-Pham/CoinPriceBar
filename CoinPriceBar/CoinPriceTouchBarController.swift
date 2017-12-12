//
//  CoinPriceTouchBarController.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class CoinPriceTouchBarController: NSViewController {

  let priceRefreshInterval: TimeInterval = 15
  let coinPriceTouchBar = CoinPriceTouchBar()
  let coinPriceProvider: CoinPriceProvider

  init(coinPriceProvider: CoinPriceProvider) {
    self.coinPriceProvider = coinPriceProvider
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
    getBTCPrice()
    getETHPrice()
    getLTCPrice()
  }

  @objc func getBTCPrice() {
    coinPriceProvider.getPrice(of: .BTC, in: .USD) { [unowned self] price in
      self.coinPriceTouchBar.BTCPrice = price
      Timer.scheduledTimer(timeInterval: self.priceRefreshInterval, target: self, selector: #selector(CoinPriceTouchBarController.getBTCPrice), userInfo: nil, repeats: false)
    }
  }

  @objc func getETHPrice() {
    coinPriceProvider.getPrice(of: .ETH, in: .USD) { [unowned self] price in
      self.coinPriceTouchBar.ETHPrice = price
      Timer.scheduledTimer(timeInterval: self.priceRefreshInterval, target: self, selector: #selector(CoinPriceTouchBarController.getETHPrice), userInfo: nil, repeats: false)
    }
  }

  @objc func getLTCPrice() {
    coinPriceProvider.getPrice(of: .LTC, in: .USD) { [unowned self] price in
      self.coinPriceTouchBar.LTCPrice = price
      Timer.scheduledTimer(timeInterval: self.priceRefreshInterval, target: self, selector: #selector(CoinPriceTouchBarController.getLTCPrice), userInfo: nil, repeats: false)
    }
  }
}
