//
//  CoinbasePriceProvider.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 12/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

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
      guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
        let json = jsonObject as? [String: Any], let dataJson = json["data"] as? [String: Any],
        let price = dataJson["amount"] as? String else {
          DispatchQueue.main.async {
            completion(nil)
          }
          return
      }
      DispatchQueue.main.async {
        completion(price)
      }
    }.resume()
  }
}
