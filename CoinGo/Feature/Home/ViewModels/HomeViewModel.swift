//
//  HomeViewModel.swift
//  CoinGo
//
//  Created by Manish Parihar on 06.11.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published private(set) var allCoins: [CoinModel] = []
    @Published private(set) var portfolioCoins: [CoinModel] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var viewState: ViewState?
    @Published var hasError = false

    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }
    
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
    @MainActor
    func fetchAllCoins() async {
        reset()
        
        viewState = .loading
        defer {viewState = .finished}
        
        do {
            let response = try await NetworkingManager.shared.request(.coin(vs_currency: "eur", order: "market_cap_desc", per_page: 250, page: 1, sparkline: true, price_change_percentage: "24h", locale: "en"),
                                                                      type: [CoinModel].self)
            self.allCoins = response
        } catch  {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}

extension HomeViewModel {
    enum ViewState  {
        case fetching
        case loading
        case finished
    }
}

private extension HomeViewModel {
    func reset() {
        if viewState == .finished {
            allCoins.removeAll()
            viewState = nil
        }
    }
}
