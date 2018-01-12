# CoinPriceBar

![Screenshot](https://github.com/T-Pham/CoinPriceBar/blob/master/Screenshots/screenshot.png?raw=true)

Cyptocurrency prices on MacBook Touch Bar.

Supported cryptocurrencies:

- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/btc.png?raw=true" width="16px"/> [Bitcoin](https://support.binance.com/hc/en-us/articles/115000494172)
- <img src="https://github.com/theantnest/Bitcoin-Cash-Green-Art/blob/master/BCC%20Round%20Icon/BCC%20Round%20Icon%20RGBA%20(128px%20Favicon).png?raw=true" width="16px"/> [Bitcoin Cash](https://support.binance.com/hc/en-us/articles/115000922291)
- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/eth.png?raw=true" width="16px"/> [Ethereum](https://support.binance.com/hc/en-us/articles/115000499311)
- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/ltc.png?raw=true" width="16px"/> [Litecoin](https://support.binance.com/hc/en-us/articles/115000499011)
- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/xrp.png?raw=true" width="16px"/> [Ripple](https://support.binance.com/hc/en-us/articles/115002544232)
- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/miota.png?raw=true" width="16px"/> [IOTA](https://support.binance.com/hc/en-us/articles/115001835032)
- <img src="https://github.com/cjdowner/cryptocurrency-icons/blob/master/128/color/ada.png?raw=true" width="16px"/> [Cardano](https://support.binance.com/hc/en-us/articles/115003098651)

Prices are in USD and updated every 15 seconds.

Ripple, IOTA and Cardano prices are calculated by XRP/ETH price from Binance multiplied with ETH price from Coinbase.

Other prices are spot price in USD from Coinbase.

The app runs in background and can be accessed anywhere by tapping the `₿` icon on the Touch Bar Control Strip.

![Screenshot](https://github.com/T-Pham/CoinPriceBar/blob/master/Screenshots/record.gif?raw=true)

## Download

- [Mac](https://github.com/T-Pham/CoinPriceBar/releases/download/1.4/CoinPriceBar.app.zip)
- [Windows](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

![Download](https://img.shields.io/github/downloads/T-Pham/CoinPriceBar/total.svg?style=flat-square&label=&colorA=000000&colorB=000000)

## Quit the app

The app runs in background and has no visible icon on the dock. To quit the app, please use Activity Monitor, search for the CoinPriceBar process and terminate it.

## "Please support this coin / this currency"

First, have a look at the files [Data.swift](CoinPriceBar/Data.swift) and [Money.swift](CoinPriceBar/Money.swift). The code should be self-explained and you should be able to modify it to fit your needs easily.

If you want to add some coin / use some currency other than USD but don't know how to code and build the app yourself, please [open an issue](https://github.com/T-Pham/CoinPriceBar/issues/new).
I will show you how to do so or probably help create a customized app based on your request. I will also make it available for everyone else to download from the [release page](https://github.com/T-Pham/CoinPriceBar/releases).

## License

CoinPriceBar is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
