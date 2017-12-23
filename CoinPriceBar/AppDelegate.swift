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
  private let btcCharacter = Coin.BTC.unicode()

  private let coinPriceTouchBarController = CoinPriceTouchBarController()

  override init() {
    window = NSWindow(contentViewController: coinPriceTouchBarController)
    super.init()
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    DFRSystemModalShowsCloseBoxWhenFrontMost(true)
    let customTouchBarItem = NSCustomTouchBarItem(identifier: NSTouchBarItem.Identifier(rawValue: btcCharacter))
    let customTouchBarItemButton = NSButton(title: btcCharacter, target: self, action: #selector(AppDelegate.customTouchBarItemTapped))
    customTouchBarItem.view = customTouchBarItemButton
    NSTouchBarItem.addSystemTrayItem(customTouchBarItem)
    DFRElementSetControlStripPresenceForIdentifier(customTouchBarItem.identifier.rawValue, true)

    window.touchBar = coinPriceTouchBarController.touchBar
    window.makeKeyAndOrderFront(nil)
  }

  @objc private func customTouchBarItemTapped() {
    NSTouchBar.presentSystemModalFunctionBar(coinPriceTouchBarController.touchBar, systemTrayItemIdentifier: btcCharacter)
  }
}
