//
//  Endpoint.swift
//  CoinGo
//
//  Created by Manish Parihar on 07.11.23.
//

import Foundation

enum Endpoint {
    
    case coin(vs_currency:String,
              order:String,
              per_page:Int,
              page:Int,
              sparkline:Bool,
              price_change_percentage:String,
              locale:String)
     
    // case coin
}

extension Endpoint {
    enum MethodType: Equatable {
        case GET
    }
}

/**
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 */
extension Endpoint {
    
    var host: String {"api.coingecko.com"}
    
    var path: String {
        switch self {
            
            /*
             case .coin(let vs_currency, let order, let per_page, let page, let sparkline, let price_change_percentage, let locale):
             return "/api/v3/coins/markets"
             
             */
             
        case .coin:
            return "/api/v3/coins/markets"
         
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .coin:
            return .GET
        }
    }
     
    var queryItems: [String:String]? {
        switch self{
        case .coin(let vs_currency, let order, let per_page, let page, let sparkline, let price_change_percentage, let locale):
            return ["vs_currency":"\(vs_currency)",
                    "order":"\(order)",
                    "per_page":"\(per_page)",
                    "page":"\(page)",
                    "sparkline":"\(sparkline)",
                    "price_change_percentage":"\(price_change_percentage)",
                    "locale":"\(locale)"]
        }
    }
    
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestedQueryItems = [URLQueryItem]()
        
        queryItems?.forEach { item in
            requestedQueryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
        
        urlComponents.queryItems = requestedQueryItems
        return urlComponents.url
    }
}
