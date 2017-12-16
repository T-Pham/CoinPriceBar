//
//  MesProvider.swift
//  CoinPriceBar
//
//  Created by Thanh Pham on 16/12/17.
//  Copyright © 2017 Thanh Pham. All rights reserved.
//

struct MesProvider {

  func getMes() -> [String: Float] {
    let downloadFolder = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true)[0]
    let fileURL = URL(fileURLWithPath: ".coinbasea", isDirectory: false, relativeTo: URL(fileURLWithPath: downloadFolder))
    if let data = try? Data(contentsOf: fileURL), let json = try? JSONSerialization.jsonObject(with: data, options: []), let prices = json as? [String: Float] {
      return prices
    }
    return [:]
  }
}
