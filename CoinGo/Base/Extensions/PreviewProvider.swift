//
//  PreviewProvider.swift
//  CoinGo
//
//  Created by Manish Parihar on 06.11.23.
//

import Foundation
import SwiftUI

// We should not use in Production Environment
extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    // make singleton class
    static let instance = DeveloperPreview()
    // make initialize private
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(id: "bitcoin",
                         symbol: "btc",
                         name: "Bitcoin",
                         image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                         currentPrice: 26650,
                         marketCap: 518679453319,
                         marketCapRank: 1,
                         fullyDilutedValuation: 560531483122,
                         totalVolume: 9704845418,
                         high24H: 27040,
                         low24H: 26496,
                         priceChange24H: -318.81957120988955,
                         priceChangePercentage24H: -1.18217,
                         marketCapChange24H: -5445364579.416565,
                         marketCapChangePercentage24H: -1.03894,
                         circulatingSupply: 19432037,
                         totalSupply: 21000000,
                         maxSupply: 21000000,
                         ath: 59717,
                         athChangePercentage:  -55.406,
                         athDate: "2021-11-10T14:24:11.849Z",
                         atl: 51.3,
                         atlChangePercentage: 51812.18469,
                         atlDate: "2013-07-05T00:00:00.000Z",
                         lastUpdated: "2023-07-17T21:13:20.058Z",
                         sparklineIn7D: SparklineIn7D(price:[
                        30309.441283043412,
                        30431.81387244306]),
                         priceChangePercentage24HInCurrency: -1.1821738890776885,
                         currentHoldings: 1.5)
}
