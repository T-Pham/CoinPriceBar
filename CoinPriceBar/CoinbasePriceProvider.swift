//
//  CoinbasePriceProvider.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

import Cocoa

struct CoinbasePriceProvider: CoinPriceProvider {

  func getPrice(of coin: Coin, in currency: FiatMoney, completion: @escaping (String?) -> Void) {
    let url = URL(string: "https://api.coinbase.com/v2/prices/\(coin)-\(currency)/spot")!
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []), let json = jsonObject as? [String: Any], let data = json["data"] as? [String: Any], let price = data["amount"] as? String {
        DispatchQueue.main.async {
          completion(price)
        }
      } else {
        DispatchQueue.main.async {
          completion(nil)
        }
      }
    }.resume()
  }
}
