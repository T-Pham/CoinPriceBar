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
  case BCH
  case ETH
  case LTC
  case XRP
  case IOTA
  case ADA
  case XMR
  case ZIL
  case XLM
  case ARK
}

enum FiatMoney: String {
  case USD
  case CAD
}

extension Coin {

  func priceProvider() -> CoinPriceProvider {
    switch self {
    case .BTC, .BCH, .ETH, .LTC: return CoinbasePriceProvider()
    default: return BinancePriceProvider()
    }
  }
}

extension Coin {

  func unicode() -> String {
    switch self {
    case .BTC: return "₿"
    case .BCH: return "₿"
    case .ETH: return "Ξ"
    case .LTC: return "Ł"
    case .XRP: return "Ʀ"
    case .IOTA: return "ι"
    case .ADA: return "a̶"
    case .XMR: return "XMR"
    case .ZIL: return "ZIL"
    case .XLM: return "XML"
    case .ARK: return "ARK"
    }
  }

  func color() -> NSColor {
    switch self {
    case .BTC: return NSColor(displayP3Red: 244 / 255, green: 180 / 255, blue: 69 / 255, alpha: 1)
    case .BCH: return NSColor(displayP3Red: 154 / 255, green: 193 / 255, blue: 98 / 255, alpha: 1)
    case .ETH: return NSColor(displayP3Red: 115 / 255, green: 123 / 255, blue: 182 / 255, alpha: 1)
    case .LTC: return NSColor(displayP3Red: 182 / 255, green: 180 / 255, blue: 182 / 255, alpha: 1)
    case .XRP: return NSColor(displayP3Red: 62 / 255, green: 139 / 255, blue: 192 / 255, alpha: 1)
    case .IOTA: return NSColor(displayP3Red: 227 / 255, green: 227 / 255, blue: 227 / 255, alpha: 1)
    case .ADA: return NSColor(displayP3Red: 59 / 255, green: 110 / 255, blue: 207 / 255, alpha: 1)
    default: return .green
    }
  }
}
