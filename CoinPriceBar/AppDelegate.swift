//
//  AppDelegate.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

  let window: NSWindow

  let coinPriceTouchBarController: CoinPriceTouchBarController = {
    let coinbasePriceProvider = CoinbasePriceProvider()
    let coinPriceTouchBarController = CoinPriceTouchBarController(coinPriceProvider: coinbasePriceProvider)
    return coinPriceTouchBarController
  }()

  override init() {
    window = NSWindow(contentViewController: coinPriceTouchBarController)
    super.init()
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    window.touchBar = coinPriceTouchBarController.touchBar
    window.makeKeyAndOrderFront(nil)
  }
}
