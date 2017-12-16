//
//  Money.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

typealias FreedomMoney = Coin

enum Coin: String {
  case BTC
  case ETH
  case LTC

  func unicode() -> String {
    switch self {
    case .BTC: return "₿"
    case .ETH: return "Ξ"
    case .LTC: return "Ł"
    }
  }
}

enum FiatMoney: String {
  case USD
}
