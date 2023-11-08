//
//  CoinDataService.swift
//  CoinGo
//
//  Created by Manish Parihar on 06.11.23.
//

import Foundation

/*
// Lets try to use AsyncAwait instead of Combine framework
class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    init() {
        getCoins()
    }
    
    // make private because we want to access getCoins inside the CoinDataService not from any other class.
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else { return }
        
        
    }
}

*/
